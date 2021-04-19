import requests
from bs4 import BeautifulSoup as bs
url = "http://www.ssg.com/disp/category.ssg?ctgId=6000094634"
recvd = requests.get(url)
dom = bs(recvd.text,'lxml')
# 정육 > 돼지고기
list = dom.find(class_='thmb')
a = list.find('a')
h = a['href']
content_url='http://www.ssg.com'+h
img = list.find_all('img')
src = img[0]['src']
src = 'http:'+src
print(src)
with open('image\\project\\test.jpg','wb') as f:
    s = requests.get(src)
    print(s)
    f.write(s.content)
# 이미지를 얻는 코드 >>> 변수 list를 만들때 find가 아닌 find_all로 만들어서
# 반복문을 돌리면 얻을 수 있음
