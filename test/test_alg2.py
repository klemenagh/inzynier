import subprocess
import os

decorate = True

class Decorate:
   GREEN = '\033[92m' if decorate else ''
   RED = '\033[91m' if decorate else ''
   BOLD = '\033[1m' if decorate else ''
   END = '\033[0m' if decorate else ''

def get_fmt():
	return '{:>20} | {:>20} | {:>13} | {:>13}'

def fmt_line_str(a, b, c, d):
	return get_fmt().format(a, b, c, d)

def fmt_line(c, v, e, i):
	sub_total = '{:>3d} / {:>3d} ({:6.2f}%)'.format(v, i, 100.0 * v / i)
	sub_error = '{:>3d} ({:6.2f}%)'.format(e, 100.0 * e / i)
	sub_inv = '{:>3d} ({:6.2f}%)'.format(i - v - e, 100.0 * (i - v - e) / i)
	return get_fmt().format(*[c, sub_total, sub_error, sub_inv])

def h_line(lng = None):
	if lng is None:
		lng = len(fmt_line('', 0, 0, 1))
	return '-' * lng

def test(executable, flags, data_dir, classes):
	results = []
	files_invalid = []

	for subdir, desired_output in classes:
		directory = data_dir + subdir
		print(Decorate.BOLD + directory + Decorate.END)
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
					result = 'err'
					if len(err.decode("utf-8").rstrip()) is not 0:
						error += 1
						is_error = True
					result = 'inv'
					files_invalid.append(p)
				total += 1

				if result in ['err', 'inv']:
					result = Decorate.RED + result + Decorate.END
				else:
					result = Decorate.GREEN + ' ' + result +Decorate.END

				print('[{}] {:>3} / {:>3}: {}'.format(Decorate.BOLD + result + Decorate.END, curr_file, num_files, f))
		
		results.append((subdir, valid, error, total))
	return results, files_invalid

def present_results(results, files_invalid):
	total = {'v': 0, 'e': 0, 'i': 0}
	print('\n' + Decorate.BOLD + fmt_line_str('typ', 'wynik', 'błędy', 'niepoprawne') + Decorate.END)
	print(h_line())
	for c, v, e, i in results:
		total['v'] += v
		total['e'] += e
		total['i'] += i
		print(fmt_line(c, v, e, i))	
	print(h_line())
	print(Decorate.BOLD + fmt_line('łącznie', *[total['v'], total['e'], total['i']]) + Decorate.END)

	if len(files_invalid) > 0:
		print('\n' + Decorate.BOLD + 'Pliki wywołujące błędy' + Decorate.END)
		for f in files_invalid:
			print('\t' + f)

def main():
	data_dir = '../algorytm2_in_matlab/BAZA_RX/'
	executable = '../build/axles'
	executable = os.path.abspath(executable)

	flags = ''
	classes = 	[('ciezarowy_2os', '2'),
				('ciezarowy_3os', '3'),
				('ciezarowy_4os', '4'),
				('ciezarowy_5os', '5'),
				('ciezarowy_5os_up', '5up'),
				('dostawczy', '2'),
				('osobowy_alus', '2'),
				('osobowy_stal', '2')]

	results, files_invalid = test(executable, flags, data_dir, classes)
	present_results(results, files_invalid)

if __name__ == '__main__':
	main()