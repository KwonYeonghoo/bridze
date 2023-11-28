import asyncio
import telegram
import nest_asyncio
import os
nest_asyncio.apply()
# Telegram Bot의 토큰과 대화 ID 설정
TOKEN = "YOURTOKEN"
CHAT_ID = "YOURCHAT_ID"


class Tgram:
    def __init__(
        self,
        token=TOKEN,
        chat_id=CHAT_ID,
    ):
        """
        Telegram 봇을 초기화합니다.

        :param token: Telegram 봇의 토큰 (기본값: 설정된 TOKEN)
        :param chat_id: 대화 ID (기본값: 설정된 CHAT_ID)
        """
        self.bot = telegram.Bot(token=token)
        self.chat_id = chat_id

    def success(self):
        """
        성공 메시지를 Telegram 채팅에 보냅니다.
        """
        asyncio.run(self.bot.send_message(chat_id=self.chat_id, text="주피터 성공."))

    def fail(self, error_msg = ''):
        """
        에러 메시지를 Telegram 채팅에 보냅니다.

        :param error_msg: 에러 메시지 (기본값: 빈 문자열)
        """
        asyncio.run(
            self.bot.send_message(
                chat_id=self.chat_id, text=f"주피터 에러 {str(error_msg)}."
            )
        )

    def loop(self, num = 0):
        """
        루프 실행 메시지를 Telegram 채팅에 보냅니다.

        :param num: 루프 번호 (기본값: 0)
        """
        asyncio.run(
            self.bot.send_message(chat_id=self.chat_id, text=f"주피터 {num}번째 Loop 실행중.")
        )
        

    def test(self):
        """
        테스트 메시지를 Telegram 채팅에 보냅니다.
        """
        asyncio.run(self.bot.send_message(chat_id=self.chat_id, text="main으로 실행되었습니다."))


if __name__ == "__main__":
    TOKEN = "YOURTOKEN"
    CHAT_ID = "YOURCHAT_ID"

    tgram = Tgram(TOKEN, CHAT_ID)
    tgram.test()  
    print("주피터 노트북 실행 체크용 모듈입니다.")
    print("제작,사용문의 : 정성욱, oceanstar7@kakao.com")
