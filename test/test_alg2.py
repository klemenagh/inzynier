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
for subdir, desired_output in classes:
	directory = data_dir + subdir
	print(directory)
	valid = 0;
	total = 0;
	files = os.listdir(directory)
	num_files = len(files)
	curr_file = 0
	for f in files:
		curr_file += 1
		if f.endswith('lvm'):

			p = os.path.abspath(directory + '/' + f)
			print('{} / {}: {}'.format(curr_file, num_files, f))

			proc = subprocess.Popen([executable, '-f', p], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
			output = proc.stdout.read()
			txt = output.decode("utf-8").rstrip()
			if txt == desired_output:
				valid += 1
			else:
				err = proc.stderr.read()
				print(err.decode("utf-8").rstrip())
			total += 1
	
	results.append((subdir, valid, total))

for c, v, i in results:
	print(c)
	print('%3d/%3d (%5.2f%%)' % (v, i, 100.0 * v / i))