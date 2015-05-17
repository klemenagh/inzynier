import subprocess
import os

data_dir = '../algorytm2_in_matlab/BAZA_RX/'
executable = '../build/inzynier'
executable = os.path.abspath(executable)

flags = ''
classes = 	[('ciezarowy_2os', '2'),
			('ciezarowy_3os', '3'),
			('ciezarowy_4os', '4'),
			('ciezarowy_5os', '5'),
			('ciezarowy_5os_up', '5up'),
			('dostawczy', '2'),
			('osobowy_alus', '2'),
			('osobowy_stal', '2'),]

results = []
files_invalid = []

for subdir, desired_output in classes:
	directory = data_dir + subdir
	print(directory)
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

			proc = subprocess.Popen([executable, '-f', p], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
			output = proc.stdout.read()
			txt = output.decode("utf-8").rstrip()
			if txt == desired_output:
				valid += 1
			else:
				err = proc.stderr.read()
				if len(err.decode("utf-8").rstrip()) is not 0:
					error += 1
					is_error = True

				files_invalid.append(p)
			total += 1

			print('{} / {}: {} {}'.format(curr_file, num_files, f, '[error]' if is_error else ''))
	
	results.append((subdir, valid, error, total))

for c, v, e, i in results:
	print(c)
	print('%3d/%3d (%5.2f%%), %3d błędów, %3d niepoprawnych wyników' % (v, i, 100.0 * v / i, e, i - v - e))

print('Pliki wywołujące błędy')
for f in files_invalid:
	print(f)