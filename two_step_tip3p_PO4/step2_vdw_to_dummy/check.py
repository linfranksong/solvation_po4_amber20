import os

dir = os.path.dirname(os.path.realpath(__file__)) + '/'

for i in [0.00922, 0.04794, 0.11505, 0.20634, 0.31608, 0.43738, 0.56262, 0.68392, 0.79366, 0.88495, 0.95206, 0.99078]:
  wdir=dir+"%s/"%(i)
  os.chdir(wdir)
  if os.path.isfile('us.out'):
    if 'Total wall time' not in open("us.out").read():
      os.system("sbatch mh.pbs")
      print os.getcwd(),'not done'
  else:
    os.system("sbatch mh.pbs")
    print os.getcwd(), 'no no no no  file'
os.chdir(dir)
