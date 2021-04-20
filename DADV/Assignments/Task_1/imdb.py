from selenium import webdriver
import time

chromeOptions = webdriver.ChromeOptions()
preferences = {"download.default_directory" : "C:\\Users\\madhu\\Desktop\\Repositories\\Data_Science_2019501105\\DADV\\Assignments\\Task_1\\"}
chromeOptions.add_experimental_option("prefs", preferences)
chromedriver = "C:\\Users\\madhu\\Desktop\\Repositories\\Data_Science_2019501105\\DADV\\chromedriver.exe"
browser = webdriver.Chrome(executable_path=chromedriver, options=chromeOptions)
browser.maximize_window()

browser.get("https://www.imdb.com/interfaces/")

browser.find_element_by_partial_link_text("https://datasets.imdbws.com/").click()
time.sleep(1)

browser.find_element_by_partial_link_text("title.basics.tsv.gz").click()
time.sleep(1)

browser.find_element_by_partial_link_text("title.ratings.tsv.gz").click()
time.sleep(1)

# browser.close()