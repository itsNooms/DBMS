f= open(‘file.txt’,’w’)
	f= write(‘SNo	   Name	Age	City\n’)
		 (‘1	Nooman	19	VZM\n’)
		 (‘2	Leela		19	VZM\n’)
		 (‘3	Gowtham	19	VZM\n’)
		 (‘4	Jahnavi	19	VZM\n’)
	f.close()
// this creates a text file ‘file.txt’
// to print contents of file
	f= open(‘file.txt’,’r’)
	p= f.read()
	print(p)
	f= close()


f= open(‘file.txt’,’r+’)
	n= f.readlines()
	n.insert(3, ‘3	John	19	VSP\n’)
	n= (). join(n)
	f.read(0)
	f.write(n)
	f.close()
