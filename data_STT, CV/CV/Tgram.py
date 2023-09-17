import asyncio
import telegram
import nest_asyncio
import os
nest_asyncio.apply()

TOKEN = "6441009419:AAGeU_ZUW6pxvqAOwIcIA8-PH8RLRPgb9rQ"
CHAT_ID = "5862996909"


class Tgram:
    def __init__(
        self,
        token=TOKEN,
        chat_id=CHAT_ID,
    ):
        self.bot = telegram.Bot(token=token)
        self.chat_id = chat_id

    def success(self):
        asyncio.run(self.bot.send_message(chat_id=self.chat_id, text="주피터 성공."))

    def fail(self, error_msg = ''):
        asyncio.run(
            self.bot.send_message(
                chat_id=self.chat_id, text=f"주피터 에러 {str(error_msg)}."
            )
        )

    def loop(self, num = 0):
        asyncio.run(
            self.bot.send_message(chat_id=self.chat_id, text=f"주피터 {num}번째 Loop 실행중.")
        )
        

    def test(self):
        asyncio.run(self.bot.send_message(chat_id=self.chat_id, text="main으로 실행되었습니다."))


if __name__ == "__main__":
    TOKEN = "6441009419:AAGeU_ZUW6pxvqAOwIcIA8-PH8RLRPgb9rQ"
    CHAT_ID = "5862996909"

    tgram = Tgram(TOKEN, CHAT_ID)
    tgram.test()  
    print("주피터 노트북 실행 체크용 모듈입니다.")
    print("제작,사용문의 : 정성욱, oceanstar7@kakao.com")