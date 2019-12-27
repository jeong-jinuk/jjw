F_in = open('C:/Users/ADMIN/Desktop/실습자료/FDR구현실습/201909r.1.real.txt','r')
# 랭크가 1인것만 찾아서 차지별로 구분해서 저장
F_out1 = open('C:/Users/ADMIN/Desktop/실습자료/FDR구현실습/test1.txt','w')
F_out2 = open('C:/Users/ADMIN/Desktop/실습자료/FDR구현실습/test2.txt','w')
F_out3 = open('C:/Users/ADMIN/Desktop/실습자료/FDR구현실습/test3.txt','w')

for x in F_in:
    if x.split("\t")[0].startswith('Comet') or x.split("\t")[0].startswith('scan'):
        F_out1.write(str(x))
        F_out2.write(str(x))
        F_out3.write(str(x))
    if x.split("\t")[1] == '1':
        if x.split("\t")[2] == '2':
            F_out1.write(str(x))
        elif x.split("\t")[2] == '3':
            F_out2.write(str(x))
        elif int(x.split("\t")[2]) >= 4:    
            F_out3.write(str(x))

F_in.close()
F_out1.close()
F_out2.close()
F_out3.close()