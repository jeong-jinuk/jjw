F1 = open('C:/Users/ADMIN/Desktop/실습자료/FDR구현실습/test1.sorted.rm.txt','r')
F2 = open('C:/Users/ADMIN/Desktop/실습자료/FDR구현실습/test2.sorted.rm.txt','r')
F3 = open('C:/Users/ADMIN/Desktop/실습자료/FDR구현실습/test3.sorted.rm.txt','r')

with open('C:/Users/ADMIN/Desktop/실습자료/FDR구현실습/test1.sorted.rm-S.txt','w') as w1:
    sort = []        
    for line in F1:
        if line[0]=='C' or line[0]=='s':
            w1.write(line)0
        else:
            sort.append(line.split('\t'))            
    sort = sorted(sort, key = lambda sort:float(sort[5]))
    for i in range(0,len(sort)):
        w1.write('\t'.join(sort[i]).rstrip('\t'))    


with open('C:/Users/ADMIN/Desktop/실습자료/FDR구현실습/test2.sorted.rm-S.txt','w') as w2:
    sort = []        
    for line in F2:
        if line[0]=='C' or line[0]=='s':
            w2.write(line)
        else:
            sort.append(line.split('\t'))            
    sort = sorted(sort, key = lambda sort:float(sort[5]))
    for i in range(0,len(sort)):
        w2.write('\t'.join(sort[i]).rstrip('\t'))


with open('C:/Users/ADMIN/Desktop/실습자료/FDR구현실습/test3.sorted.rm-S.txt','w') as w3:
    sort = []        
    for line in F3:
        if line[0]=='C' or line[0]=='s':
            w3.write(line)
        else:
            sort.append(line.split('\t'))            
    sort = sorted(sort, key = lambda sort:float(sort[5]))
    for i in range(0,len(sort)):
        w3.write('\t'.join(sort[i]).rstrip('\t'))


F1.close()
F2.close()
F3.close()

