# On February 29th, 2020 B.C. (Before Corona) I arrived in Thailand for a 3-month-long backpacking adventure. Little did
# I know that the world would soon change forever. As Covid-19 cases, civil unrest, and economic turmoil spiked back
# home in the US, Covid-free Thailand was the perfect escape. 3 months became a year, and in the meantime, I decided to
# learn some Thai and Python (arguably the weirdest combination of languages on Earth). Being an ex-engineer, I am all
# about efficiency. So I decided to write a program that lets me practice both languages simultaneously, and also tells
# me which consonants are most prevalent so I could better focus my efforts on learning those first. Here it is!

from bs4 import BeautifulSoup as soup
from urllib.request import urlopen as uReq

url = 'https://th.wikipedia.org/wiki/%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B9%80%E0%B8%97%E0%B8%A8%E0%B9%84%E0%B8%97%E0' \
      '%B8%A2 '


def cons_count(my_url):
    """Prints a dictionary of number of Thai consonants
       in the paragraph <p> tags of any URL"""

    # opening connection, grabbing page
    uClient = uReq(my_url)
    page_html = uClient.read()
    uClient.close()

    # html parsing
    page_soup = soup(page_html, 'html.parser')
    p_tags = page_soup.findAll('p')

    # initialize empty dictionary
    char_dict = {}

    # nested loop that counts consonants
    for text in p_tags:
        for char in text.text:
            if char in char_dict:
                char_dict[char] += 1
            else:
                char_dict[char] = 1

    consonants = ['ก', 'ข', 'ค', 'ฃ', 'ฅ', 'ฆ', 'ง', 'จ', 'ฉ', 'ฃ', 'ซ', 'ณ', 'ญ', 'ฎ', 'ฏ', 'ฐ', 'ฑ', 'ฒ', 'ณ', 'ด',
                  'ต', 'ถ', 'ท', 'ธ', 'น', 'บ', 'ป', 'ผ', 'ฟ', 'พ', 'ฝ', 'ภ', 'ม', 'ย', 'ร', 'ล', 'ว', 'ศ', 'ษ', 'ส',
                  'ห', 'ฬ', 'อ', 'ฮ']

    # filter out characters that are not Thai consonants
    filt_char_dict = {}
    for k, v in char_dict.items():
        if k in consonants:
            filt_char_dict.update({k: v})

    # sort dictionary by value (consonant count)
    filt_char_dict = {k: v for k, v in sorted(filt_char_dict.items(), key=lambda item: item[1])}

    # print key, value pairs
    for k, v in filt_char_dict.items():
        print(k, v)


cons_count(url)
