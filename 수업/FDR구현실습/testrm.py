import copy

F1 = open('D:/KISTI/실습자료/FDR구현실습/test1.sorted.txt','r')
F2 = open('D:/KISTI/실습자료/FDR구현실습/test2.sorted.txt','r')
F3 = open('D:/KISTI/실습자료/FDR구현실습/test3.sorted.txt','r')

# idea = 리스트를 복사해서 순위가 같을때 이밸류값을 비교한 후 이밸류가 가장 작지 않으면 복사한 리스트에서 인덱스로 삭제함
with open('D:/KISTI/실습자료/FDR구현실습/test1.sorted.rm.txt','w') as w1:
    sort = []
    count = 0
    for line in F1:
        if line[0]=='C' or line[0]=='s':
            w1.write(line)
        else:
            sort.append(line.split('\t'))   
    sort = sorted(sort,key=lambda sort: int(sort[0]))        
    removel = copy.copy(sort)
    for i,x in enumerate(sort):
        if x[0] != sort[i-1][0]:
            continue
        else:
            for y in removel:
                if x[0] == y[0]:
                    if x[5] > y[5]:
                        removel.pop(removel.index(sort[i]))
                else:   
                    break
                
    for i in range(0, len(removel)):
        w1.write("\t".join(removel[i]).rstrip("\t"))

with open('D:/KISTI/실습자료/FDR구현실습/test2.sorted.rm.txt','w') as w2:
    sort = []
    count = 0
    for line in F2:
        if line[0]=='C' or line[0]=='s':
            w2.write(line)
        else:
            sort.append(line.split('\t'))   
    sort = sorted(sort,key=lambda sort: int(sort[0]))        
    removel = copy.copy(sort)
    for i,x in enumerate(sort):
        if x[0] != sort[i-1][0]:
            continue
        else:
            for y in removel:
                if x[0] == y[0]:
                    if x[5] > y[5]:
                        removel.pop(removel.index(sort[i]))
                else:   
                    break
                
    for i in range(0, len(removel)):
        w2.write("\t".join(removel[i]).rstrip("\t"))

with open('D:/KISTI/실습자료/FDR구현실습/test3.sorted.rm.txt','w') as w3:
    sort = []
    count = 0
    for line in F3:
        if line[0]=='C' or line[0]=='s':
            w3.write(line)
        else:
            sort.append(line.split('\t'))   
    sort = sorted(sort,key=lambda sort: int(sort[0]))        
    removel = copy.copy(sort)
    for i,x in enumerate(sort):
        if x[0] != sort[i-1][0]:
            continue
        else:
            for y in removel:
                if x[0] == y[0]:
                    if x[5] > y[5]:
                        removel.pop(removel.index(sort[i]))
                else:   
                    break
                
    for i in range(0, len(removel)):
        w3.write("\t".join(removel[i]).rstrip("\t"))
F1.close()
F2.close()
F3.close()