from selenium import webdriver
import time
import requests
from bs4 import BeautifulSoup as bs
import pymysql as my

conn = my.connect(host='localhost', port=3306, user='root', password='1234',database='ssg',charset='utf8')
cur = conn.cursor(my.cursors.DictCursor)
sql = 'insert into product(prod_id,prod_name,prod_price,prod_rate,prod_category,prod_dcategory,prod_writeday,prod_desc1,prod_desc2,prod_desc3,prod_desc4,prod_desc5,prod_desc6,prod_producer,prod_expire,prod_origin,prod_storage)'
sql = sql+'''  values("{}", "{}", {}, {}, "porkegg", "pork", now(), "{}", "{}", "{}", "{}", "{}", "{}", "{}", "{}", "{}", "{}")'''
driver = webdriver.Chrome('chromedriver.exe')
url = 'http://www.ssg.com/item/itemView.ssg?itemId=2097000810737&siteNo=7009&salestrNo=2449'
headers={'User-Agent':'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'}
recvd = requests.get(url,headers=headers)
print(recvd)
dom = bs(recvd.content,'html.parser')
title = dom.find(class_="cdtl_info_tit").text # 상품이름
title= title[:title.find('원')]
title =title.strip()
price = dom.find(class_="ssg_price").text # 가격
price = price.replace(',','')
id = dom.find(class_="cdtl_prd_num").text # 상품 코드
id = id[id.find(':')+2:].strip()
rate = dom.find(class_="cdtl_grade_total").text
intag = dom.find_all(class_="in")
producer = intag[3].text
expire = intag[7].text
expire = expire.replace('/',' ')
origin = intag[21].text
storage = intag[17].text
time.sleep(2)
driver.get(url)
driver.switch_to.frame('_ifr_html')
md_tit = driver.find_element_by_xpath('//*[@id="wrap_ifr"]/div/div[2]/div').text
sub_tit = driver.find_elements_by_xpath('//*[@id="wrap_ifr"]/div/div[2]/p')[0].text
pick_txts = driver.find_elements_by_xpath('//*[@id="wrap_ifr"]/div/div[4]/div')
pick_txt1 = pick_txts[0].text
pick_txt2 = pick_txts[1].text
tmpl_paragraph1 = driver.find_element_by_xpath('//*[@id="wrap_ifr"]/div/div[5]/div[2]/div').text
tmpl_paragraph2 = driver.find_element_by_xpath('//*[@id="wrap_ifr"]/div/div[5]/div[2]/p').text

time.sleep(2)
# print(sql.format(id,title,price,rate,md_tit,sub_tit,pick_txt1,pick_txt2,tmpl_paragraph1,tmpl_paragraph2,producer,expire,origin,storage))
cur.execute(sql.format(id,title,price,rate,md_tit,sub_tit,pick_txt1,pick_txt2,tmpl_paragraph1,tmpl_paragraph2,producer,expire,origin,storage))
conn.commit()
conn.close()

driver.switch_to.default_content() # 다시 기본으로 돌아오는 코드
time.sleep(2)

driver.close()
time.sleep(3)