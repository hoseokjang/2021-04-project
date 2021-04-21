from selenium import webdriver
import time
import requests
from bs4 import BeautifulSoup as bs
driver = webdriver.Chrome('chromedriver.exe')
url = 'http://www.ssg.com/item/itemView.ssg?itemId=2097000985275&siteNo=7009&salestrNo=2449'
headers={'User-Agent':'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'}
recvd = requests.get(url,headers=headers)
dom = bs(recvd.content,'html.parser')
title = dom.find(class_="cdtl_info_tit").text # 상품이름
title = title[:title.find('원')]
print(title)
driver.get(url)
time.sleep(2)
driver.switch_to.frame('_ifr_html')
md_tit = driver.find_element_by_xpath('//*[@id="wrap_ifr"]/div/div[2]/div').text
sub_tit = driver.find_elements_by_xpath('//*[@id="wrap_ifr"]/div/div[2]/p')[0].text
pick_txts = driver.find_elements_by_xpath('//*[@id="wrap_ifr"]/div/div[4]/div')
pick_txt1 = pick_txts[0].text
pick_txt2 = pick_txts[1].text
tmpl_paragraph1 = driver.find_element_by_xpath('//*[@id="wrap_ifr"]/div/div[5]/div[2]/div').text
tmpl_paragraph2 = driver.find_element_by_xpath('//*[@id="wrap_ifr"]/div/div[5]/div[2]/p').text

time.sleep(2)
driver.switch_to.default_content() # 다시 기본으로 돌아오는 코드
time.sleep(2)
driver.close()

# 상세 이미지는 메인 이미지 하나로 대체? (굳이 상세하게 다 받아올 이유가 있는지)