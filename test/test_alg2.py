import subprocess
import os
import json
import sys


class Decorate:
    decorate = False

    @staticmethod
    def green():
        return '\033[92m' if Decorate.decorate else ''

    @staticmethod
    def red():
        return '\033[91m' if Decorate.decorate else ''

    @staticmethod
    def bold():
        return '\033[1m' if Decorate.decorate else ''

    @staticmethod
    def end():
        return '\033[0m' if Decorate.decorate else ''


def get_fmt():
    return '{:>20} | {:>20} | {:>13} | {:>13}'


def fmt_line_str(a, b, c, d):
    return get_fmt().format(a, b, c, d)


def fmt_line(c, v, e, i):
    sub_total = '{:>3d} / {:>3d} ({:6.2f}%)'.format(v, i, 100.0 * v / i)
    sub_error = '{:>3d} ({:6.2f}%)'.format(e, 100.0 * e / i)
    sub_inv = '{:>3d} ({:6.2f}%)'.format(i - v - e, 100.0 * (i - v - e) / i)
    return get_fmt().format(*[c, sub_total, sub_error, sub_inv])


def h_line(lng=None):
    if lng is None:
        lng = len(fmt_line('', 0, 0, 1))
    return '-' * lng


def test(executable, data_dir, classes):
    results = []
    files_invalid = []

    for subdir, desired_output in classes:
        directory = data_dir + subdir
        print(Decorate.bold() + directory + Decorate.end())
        valid = 0
        error = 0
        total = 0

        files = os.listdir(directory)
        num_files = len(files)
        curr_file = 0
        for f in files:
            curr_file += 1
            if f.endswith('lvm'):

                p = os.path.abspath(directory + '/' + f)
                is_error = False

                proc = subprocess.Popen([executable, p], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
                output = proc.stdout.read()
                txt = output.decode("utf-8").rstrip().split()

                if txt[1] == desired_output:
                    valid += 1
                    result = 'ok'
                else:
                    err = proc.stderr.read()
                    is_error = True
                    result = 'err'
                    if len(err.decode("utf-8").rstrip()) is not 0:
                        error += 1
                        result = 'inv'
                    files_invalid.append(p)
                total += 1

                if is_error:
                    result = Decorate.red() + result + Decorate.end()
                else:
                    result = Decorate.green() + ' ' + result + Decorate.end()

                print(
                    '[{}] {:>3} / {:>3}: {}'.format(Decorate.bold() + result + Decorate.end(), curr_file, num_files, f))

        results.append((subdir, valid, error, total))
    return results, files_invalid


def present_results(results, files_invalid):
    total = {'v': 0, 'e': 0, 'i': 0}
    print('\n' + Decorate.bold() + fmt_line_str('typ', 'wynik', 'bledy', 'niepoprawne') + Decorate.end())
    print(h_line())
    for c, v, e, i in results:
        total['v'] += v
        total['e'] += e
        total['i'] += i
        print(fmt_line(c, v, e, i))
    print(h_line())
    print(Decorate.bold() + fmt_line('lacznie', *[total['v'], total['e'], total['i']]) + Decorate.end())

    if len(files_invalid) > 0:
        print('\n' + Decorate.bold() + 'Pliki wywolujace bledy' + Decorate.end())
        for f in files_invalid:
            print('    ' + f)


def main():
    with open('config.json', 'r') as f:
        json_config = json.loads(f.read())

    data_dir = json_config['root_directory']
    executable = os.path.abspath(json_config['executable'])
    Decorate.decorate = json_config['decorate']

    classes = []
    for c in json_config['directories']:
        classes.append(c)

    results, files_invalid = test(executable, data_dir, classes)
    present_results(results, files_invalid)

    sys.exit(0 if len(files_invalid) == 0 else 1)

if __name__ == '__main__':
    main()
