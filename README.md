# 🛫 다문화가정 아이들을 세상으로 잇다, BridZe 🌎

## 📝 베트남 다문화 아이들의 언어 및 정서 평가, 기관 연결 플랫폼
---

### Front-end
<p>
   <img src="https://img.shields.io/badge/Flutter-02569B.svg?style=for-the-badge&logo=Flutter&logoColor=white">
</p>
   
### Back-end
<p>
   <img src="https://img.shields.io/badge/Flask-02569B.svg?style=for-the-badge&logo=Flask&logoColor=white">
   <img src="https://img.shields.io/badge/Goorm-02569B.svg?style=for-the-badge&logo=Goorm&logoColor=white">
</p>

### Communication
<p>
  <img src="https://img.shields.io/badge/Google Meet-00897B.svg?style=for-the-badge&logo=Google Meet&logoColor=white">
  <img src="https://img.shields.io/badge/Notion-000000.svg?style=for-the-badge&logo=Notion&logoColor=white">
</p>
  
### Version Control
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)
![GitKraken](https://img.shields.io/badge/GitKraken-179287.svg?style=for-the-badge&logo=GitKraken&logoColor=white)

##
---


## 소개 

BridZe는 정보 소외 대상자이자 디지털 소외 계층인 베트남 다문화가정 아동을 위한 언어와 정서 평가를 통한 기관 추천 서비스로, 베트남 다문화가정 아동의 발음과 읽기능력을 평가하고 아동의 표정과 유대관계를 평가하여 분석하고 언어 문제의 경우 언어 교육 기관으로, 정서 문제인 경우 심리 상담 기관을 추천해줍니다. 

다문화가정 아동 혹은 한국 아동을 위한 언어 교육 기관과 심리 상담 기관은 국내에 많이 존재하고 있습니다. 그러나 한국 가정 부모님들과 달리 다문화가정 부모님들은 이러한 자원을 활용하기 위한 아동 관찰 및 정보 찾기를 통한 문제 해결이 어렵습니다. 따라서 다문화가정 아동들도 한국 아동들과 동일하게 제대로 된 환경에서 성장할 수 있도록 정보 소외 대상자인 이들이 아동을 직접 오랜 시간 관찰하고 정보를 찾아보지 않고도 기관을 이용할 수 있도록 BridZe 서비스가 개발되어야합니다.

---
## 환경 설정

---

## 모델 성능 결과
|모델|정확도|
|---|---|
|openai whisper|80.7|
|BridZe fine tuned whisper|92.7|
|vggnet|.|
|BridZe fine tuned vggnet|82.6|
|BridZe fine tuned SEvggnet|.|
---

## 모델과 서비스 연결

---
## 서비스 흐름도

![서비스 흐름도](https://github.com/BridZe/bridze/assets/89845380/97583ad6-c8ad-4aa0-af2b-944b46edbca5)

## 언어 평가 과정

![stt](https://github.com/BridZe/bridze/assets/89845380/35c4dec5-07cc-4e7d-9bd4-0d896e6d0472)

아동의 나이에 맞는 수준의 지정 발화를 읽어 Flutter 내에서 음성 녹음을 진행합니다. 음성이 녹음되면 해당 음성 파일은 whisper 모델 안에서 전처리와 토큰화를 거쳐 텍스트로 전사되고 정답셋과 비교하여 글자 단위 비교 알고리즘인 CRR 알고리즘을 통해 100점 만점으로 환산되어 점수를 받게 됩니다. 받은 점수는 AI HUB의 한국어 아동 음성 데이터, 어린이 음성 데이터를 통해 계산된 통계 기반 임계치로 상, 중, 하로 결과를 받게 됩니다. 베트남 부모님도 이와 동일한 방식으로 언어 평가를 받게 됩니다.

### 아동 임계치

|나이|상|중|하|
|---|---|---|---|
|5세 - 7세|100 ~ 88|87 ~ 69|68 ~ 0|
|8 - 10세|100 ~ 91|90 ~ 73|72 ~ 0|
|11세 - 13세|100 ~ 97|96 ~ 76|75~ 0|

### 부모 임계치
|상|중|하|
|---|---|---|
|100~97|96~89|88 ~ 0|

- 모델 연결 위치 : https://github.com/BridZe/bridze/tree/master/backend (참고)

## 정서 평가 과정
![정서평가과정](https://github.com/BridZe/bridze/assets/89845380/d79f46f3-9d60-4751-95dd-39879c502787)

베트남 다문화가정 아동이 검증된 테스트지를 바탕으로 한 질문 5개에 답을 합니다. 답변은 임의의 가중치에 의해 100점 만점으로 환산되어 저장됩니다. 기존 테스트지의 기준에 따라 상, 중상, 중하, 하 4단계로 나누어 평가받게 됩니다. 유대관계 테스트지에 답하는 중간중간 BridZe의 캐릭터 토리찌가 부모님과 관련된 질문을 하고 아동은 이에 답하게 됩니다. Flutter 내에서 화면이 녹화되는 동안 mediapipe 기술로 얼굴을 인식하여 잡아내고 SEvggnet이 해당 범위 내에서 아동의 표정이 '행복, 슬픔, 화남, 불안(두려움), 무표정' 중 어떠한 표정인지를 판단하여 부모님에 대한 질문에 답할 때의 주된 표정이 무엇인지를 테스트 점수와 함께 제공합니다. 이어, 언어적인 소통이 안되는 관계일수록 비언어적인 요소를 파악하여 유대관계를 형성하는 것의 중요성은 높아집니다. 이러한 이유로 의사소통이 어려운 베트남 부모님과 다문화가정 아동의 좋은 유대관계 형성을 위하여 아동의 5가지 표정 모음집을 위와 동일한 방식으로 mediapipe와 vggnet을 통해 분류해 제공하도록 합니다. 표정을 판별할 때에는 5초간 촬영을 진행하며 0.5초마다 화면을 캡처하여 가장 높은 확률로 제시된 감정의 표정과 동일한 표정이라고 분류된 사진을 제공합니다. 마지막으로 Flutter 내 촬영된 영상을 제공하여 부모님이 확인할 수 있으며 기관에서도 참고할 수 있습니다.


- 모델 연결 위치 : https://github.com/BridZe/bridze/tree/master/backend (참고)


### Contributors 👩‍💻👨‍💻
<a href="https://github.com/chaenni0312"><img src="https://img.shields.io/badge/chaenni0312-black?style=social-square&logo=github&logoColor=white"/></a>
<a href="https://github.com/KwonYeonghoo"><img src="https://img.shields.io/badge/KwonYeonghoo-black?style=social-square&logo=github&logoColor=white"/></a>
<a href="https://github.com/park-hyunbin"><img src="https://img.shields.io/badge/Park Hyunbin-black?style=social-square&logo=github&logoColor=white"/></a>
<a href="https://github.com/oceanstar777"><img src="https://img.shields.io/badge/oceanstar777-black?style=social-square&logo=github&logoColor=white"/></a>
<a href="https://github.com/chaksseu"><img src="https://img.shields.io/badge/chaksseu-black?style=social-square&logo=github&logoColor=white"/></a>
<a href="https://github.com/Hongjunior"><img src="https://img.shields.io/badge/Hongjunior-black?style=social-square&logo=github&logoColor=white"/></a>
