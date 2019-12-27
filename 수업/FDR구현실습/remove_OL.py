import copy

F1 = open('D:/KISTI/실습자료/FDR구현실습/test1.sorted.txt','r')
F2 = open('D:/KISTI/실습자료/FDR구현실습/test2.sorted.txt','r')
F3 = open('D:/KISTI/실습자료/FDR구현실습/test3.sorted.txt','r')


with open('D:/KISTI/실습자료/FDR구현실습/test1.sorted.rm.txt','w') as w1:
    sort = []
    remove = []
    count = 0
    for line in F1:
        if line[0]=='C' or line[0]=='s':
            w1.write(line)
        else:
            sort.append(line.split('\t'))           
    for i in range(0,len(sort)):
        if len(remove) == 0:
            remove.append(sort[i])
        else:
            if sort[i][0] == remove[count - 1][0]:
                if float(sort[i][5]) < float(remove[count - 1][5]):
                    remove[count - 1] = sort[i]
                count = count - 1
            else:
                remove.append(sort[i])
            count = count + 1
    for i in range(0, len(remove)):
        w1.write("\t".join(remove[i]).rstrip("\t"))

with open('D:/KISTI/실습자료/FDR구현실습/test2.sorted.rm.txt','w') as w2:
    sort = []
    remove = []
    count = 0
    for line in F2:
        if line[0]=='C' or line[0]=='s':
            w2.write(line)
        else:
            sort.append(line.split('\t'))           
    for i in range(0,len(sort)):
        if len(remove) == 0:
            remove.append(sort[i])
        else:
            if sort[i][0] == remove[count - 1][0]:
                if float(sort[i][5]) < float(remove[count - 1][5]):
                    remove[count - 1] = sort[i]
                count = count - 1
            else:
                remove.append(sort[i])
            count = count + 1
    for i in range(0, len(remove)):
        w2.write("\t".join(remove[i]).rstrip("\t"))

with open('D:/KISTI/실습자료/FDR구현실습/test3.sorted.rm.txt','w') as w3:
    sort = []
    remove = []
    count = 0
    for line in F3:
        if line[0]=='C' or line[0]=='s':
            w3.write(line)
        else:
            sort.append(line.split('\t'))           
    for i in range(0,len(sort)):
        if len(remove) == 0:
            remove.append(sort[i])
        else:
            if sort[i][0] == remove[count - 1][0]:
                if float(sort[i][5]) < float(remove[count - 1][5]):
                    remove[count - 1] = sort[i]
                count = count - 1
            else:
                remove.append(sort[i])
            count = count + 1
    for i in range(0, len(remove)):
        w3.write("\t".join(remove[i]).rstrip("\t"))

F1.close()
F2.close()
F3.close()





'''
    sort =[]
    remove_l =[]
    count = 0
    for x in F1:
        if x.split("\t")[0].startswith('Comet') or x.split("\t")[0].startswith('scan'):
            w1.write(x)
        else:
            sort.append(x.split("\t"))
    sort = sorted(sort,key=lambda sort: int(sort[0]))
    for i in range(0,len(sort)):
        if len(remove_l) == 0:
            remove_l.append(sort[i])
        else:
            if sort[i][0] == remove_l[count-1][0]:
                if float(sort[i][5]) < float(remove_l[count-1][5]):
                    remove_l[count-1] = x
                count -= 1
            else:
                remove_l.append(sort[i])
            count += 1   
    for i in range(0,len(remove_l)):
        w1.write("\t".join(remove_l[i]).rstrip('\t'))
'''            