import requests
from bs4 import BeautifulSoup as bs
for i in range(1,4):
    url = "http://www.ssg.com/disp/category.ssg?dispCtgId=6000094634&page={}".format(i) # 정육 > 돼지고기
    recvd = requests.get(url)
    dom = bs(recvd.text,'lxml')
    list = dom.find_all(class_='thmb')
    # print(list)
    with open('data\\project\\돼지고기\\돼지고기.txt','a',encoding='utf-8') as f:
        for x in list: # 사진을 클릭하면 상품의 상세내용으로 들어가기 때문에 그걸 이용해서 뽑아옴
            a = x.find('a') # 이 뽑아온 링크를 저장시켜 주소를 변경해가며 각 상품의 정보를 빼오면 됨
            h = a['href']
            content_url='http://www.ssg.com'+h
        # print(content_url)
            f.write(content_url+'\n')
    for x in list: # 이미지를 얻을 수 있는 반복문
        img = x.find('img') # item/ *** _i1 에 있는 ***는 각 상품의 고유 상품 코드
        # 이 코드와 상세 정보의 상품코드를 맞춰 이미지를 띄우면 됨
        src = img['src']
        src = 'http:'+src
        # print(src)
        with open('image\\project\\'+src[-24:],'wb') as f: # 이미지를 얻는 코드
            s = requests.get(src)
    #     print(s)
            f.write(s.content)
# 이미지를 얻는 코드 >>> 변수 list를 만들때 find가 아닌 find_all로 만들어서
# 반복문을 돌리면 얻을 수 있음
