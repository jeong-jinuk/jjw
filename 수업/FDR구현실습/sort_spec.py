F1 = open('C:/Users/ADMIN/Desktop/실습자료/FDR구현실습/test1.txt','r')
F2 = open('C:/Users/ADMIN/Desktop/실습자료/FDR구현실습/test2.txt','r')
F3 = open('C:/Users/ADMIN/Desktop/실습자료/FDR구현실습/test3.txt','r')


with open('C:/Users/ADMIN/Desktop/실습자료/FDR구현실습/test1.sorted.txt','w') as w1:
    sort =[]
    for x in F1:
        if x.split("\t")[0].startswith('Comet') or x.split("\t")[0].startswith('scan'):
            w1.write(x)
        else:
            sort.append(x.split("\t"))
    sort = sorted(sort,key=lambda sort: int(sort[0]))
    for i in range(0,len(sort)):
        w1.write("\t".join(sort[i]).rstrip('\t'))

with open('C:/Users/ADMIN/Desktop/실습자료/FDR구현실습/test2.sorted.txt','w') as w2:
    sort =[]
    for x in F2:
        if x.split("\t")[0].startswith('Comet') or x.split("\t")[0].startswith('scan'):
            w2.write(x)
        else:
            sort.append(x.split("\t"))
    sort = sorted(sort,key=lambda sort: int(sort[0]))
    for i in range(0,len(sort)):
        w2.write("\t".join(sort[i]).rstrip('\t'))

with open('C:/Users/ADMIN/Desktop/실습자료/FDR구현실습/test3.sorted.txt','w') as w3:
    sort =[]
    for x in F3:
        if x.split("\t")[0].startswith('Comet') or x.split("\t")[0].startswith('scan'):
            w3.write(x)
        else:
            sort.append(x.split("\t"))
    sort = sorted(sort,key=lambda sort: int(sort[0]))
    for i in range(0,len(sort)):
        w3.write("\t".join(sort[i]).rstrip('\t'))

F1.close()
F2.close()
F3.close()