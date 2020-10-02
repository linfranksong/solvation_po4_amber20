import os

dir = os.path.dirname(os.path.realpath(__file__)) + '/'

lamb = [0.00922, 0.04794, 0.11505, 0.20634, 0.31608, 0.43738, 0.56262, 0.68392, 0.79366, 0.88495, 0.95206, 0.99078]
for n in range(0,len(lamb)):
  i=lamb[n]
  os.system("rm -r %s"%(i))
  os.system("cp -r temp %s"%(i))
  wdir=dir+"%s/"%(i)
  os.chdir(wdir)
  os.system("sed -i 's/XXX/%s/g' *.in"%(i))
  os.system("sed -i 's/XXX/%s/g' *.pbs"%(i))
  os.system("sbatch mh.pbs")
  os.chdir(dir)
