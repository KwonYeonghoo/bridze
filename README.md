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
# Whisper file tree
```
📦data_STT, CV
 ┣ 📂Whisper_finetuned
 ┃ ┣ 📂flagged
 ┃ ┣ 📂git-lfs-3.4.0(파일 생략)
 ┃ ┣ 📂Whisper_trained_model
 ┃ ┃ ┣ 📜.gitattributes
 ┃ ┃ ┣ 📜.gitignore
 ┃ ┃ ┣ 📜added_tokens.json
 ┃ ┃ ┣ 📜config.json
 ┃ ┃ ┣ 📜generation_config.json
 ┃ ┃ ┣ 📜merges.txt
 ┃ ┃ ┣ 📜normalizer.json
 ┃ ┃ ┣ 📜preprocessor_config.json
 ┃ ┃ ┣ 📜pytorch_model.bin
 ┃ ┃ ┣ 📜README.md
 ┃ ┃ ┣ 📜special_tokens_map.json
 ┃ ┃ ┣ 📜tokenizer_config.json
 ┃ ┃ ┣ 📜training_args.bin
 ┃ ┃ ┣ 📜vocab.json
 ┃ ┃ ┗ 📂runs
 ┃ ┣ 📜=0.30
 ┃ ┣ 📜=2.6.1
 ┃ ┗ 📜Whisper_코드.ipynb
 ┗ 📂Whisper용 원천 데이터(샘플 100개)
 ┃ ┣ 📂라벨링 데이터(샘플 100개)
 ┃ ┃ ┣ 📜VN10QC226_VN0005_20210801.csv
 ┃ ┃ ┣ 📜VN10QC226_VN0009_20210810.csv
                 . . .
 ┃ ┃ ┣ 📜VN10QC227_VN0082_20210802.csv
 ┃ ┃ ┗ 📜VN10QC227_VN0083_20210812.csv
 ┃ ┗ 📂오디오 파일(샘플 100개)
 ┃ ┃ ┣ 📜VN10QC226_VN0005_20210801.wav
 ┃ ┃ ┣ 📜VN10QC226_VN0009_20210810.wav
                 . . .
 ┃ ┃ ┣ 📜VN10QC227_VN0082_20210802.wav
 ┃ ┃ ┗ 📜VN10QC227_VN0083_20210812.wav
```
---

---
# 환경 설정
- whisper fined tune 코드 : `data_STT, CV/Whisper_finetuned/Whisper_코드.ipynb`
- whisper fine tuning에 사용된 데이터셋 : 인공지능 학습을 위한 외국인 한국어 발화 음성 데이터의 베트남 도메인 19만 데이터
   - 해당 데이터셋의 전체 버전은 [ai hub](https://www.aihub.or.kr/aihubdata/data/view.do?currMenu=115&topMenu=100&aihubDataSe=realm&dataSetSn=505)에서 다운이 가능합니다.
- whisper 구동 환경 : pytorch , cuda 를 설치합니다.
   - 설치 방법 참조 : https://pytorch.org/get-started/previous-versions/
- whisper 사용 방법 (데이터 불러오기) : Hugging face에 fine-tuning 완료된 모델을 올려놓았기 때문에 API로 언제든 불러다 쓸 수 있지만, fine tuning 과정의 검증이 필요하실 경우, 위 쪽의 전처리 코드는 모두 건너뛰고 중간의 `loaded_dataset_dict = DatasetDict.load_from_disk("/content/drive/MyDrive/bridze_data")` 이 코드부터 실행하시면 됩니다. (경로는 저장위치에 맞게 수정하시면 됩니다.)
   - bridze_data는 이 [데이터셋](https://drive.google.com/drive/u/1/folders/11qAPKh_tbQM3x48KM_yYE1LZRKK_CNi3)을 다운받으시면 됩니다.
---

# 모델 성능 결과
|모델|정확도|
|---|---|
|openai whisper|80.7|
|BridZe fine tuned whisper|92.7|
|vggnet|.|
|BridZe fine tuned vggnet|82.6|
|BridZe fine tuned SEvggnet|.|
---

# 모델과 서비스 연결
## Backend

백엔드(flask)에서는 프론트엔드(flutter)와 상호작용하며 음성 및 이미지 데이터 관련 다양한 작업을 처리합니다. 음성을 텍스트로 변환하는(STT) 기능, Character Recognition Rate (CRR) 점수 산정, 비디오 프레임 추출, 이미지 감정 분석 등의 기능을 지원합니다.
- flask 파일 위치: `/bridze/backend/application.py`

## 1. 음성 데이터 텍스트 변환 (Whisper)

음성 데이터를 텍스트 데이터로 변환합니다. 해당 기능은 Hugging Face에 업로드한 모델 API를 받아 사용합니다. 

- 모델 실행 위치: `/bridze/backend/stt/model_stt.py`
- Hugging Face 모델 주소: https://huggingface.co/models/oceanstar/bridze (수정필요)

## 2. 데이터 분석 (CRR)

입력된 텍스트 데이터를 저장된 지정발화 문장으로 평가하여 100점 만점으로 반환하는 알고리즘입니다.

- 알고리즘 실행 위치: `/bridze/backend/stt/crr.py`

## 3. 얼굴 및 감정 인식 (Mediapipe + VGGNet)

 Mediapipe를 사용하여 얼굴을 감지하고, 학습된 VGGNet 모델을 활용하여 감지된 얼굴의 감정을 예측합니다.

- 학습 모델 파일: `/bridze/backend/facial_emotion_recognition/vggnet_weigt.h5`
- 모델 실행 위치: `/bridze/backend/facial_emotion_recognition/model_cv.py`

## 4. 동영상 프레임 추출

OpenCV를 사용하여 동영상 파일을 읽고 지정된 간격으로 프레임을 추출하여 이미지로 저장합니다. 추출된 프레임은 `frames` 폴더에 저장됩니다.

- 알고리즘 실행 위치: `/bridze/backend/videos/video2frame.py`
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

## 정서 평가 과정
![정서평가과정](https://github.com/BridZe/bridze/assets/89845380/d79f46f3-9d60-4751-95dd-39879c502787)

베트남 다문화가정 아동이 검증된 테스트지를 바탕으로 한 질문 5개에 답을 합니다. 답변은 임의의 가중치에 의해 100점 만점으로 환산되어 저장됩니다. 기존 테스트지의 기준에 따라 상, 중상, 중하, 하 4단계로 나누어 평가받게 됩니다. 유대관계 테스트지에 답하는 중간중간 BridZe의 캐릭터 토리찌가 부모님과 관련된 질문을 하고 아동은 이에 답하게 됩니다. Flutter 내에서 화면이 녹화되는 동안 mediapipe 기술로 얼굴을 인식하여 잡아내고 SEvggnet이 해당 범위 내에서 아동의 표정이 '행복, 슬픔, 화남, 불안(두려움), 무표정' 중 어떠한 표정인지를 판단하여 부모님에 대한 질문에 답할 때의 주된 표정이 무엇인지를 테스트 점수와 함께 제공합니다. 이어, 언어적인 소통이 안되는 관계일수록 비언어적인 요소를 파악하여 유대관계를 형성하는 것의 중요성은 높아집니다. 이러한 이유로 의사소통이 어려운 베트남 부모님과 다문화가정 아동의 좋은 유대관계 형성을 위하여 아동의 5가지 표정 모음집을 위와 동일한 방식으로 mediapipe와 vggnet을 통해 분류해 제공하도록 합니다. 표정을 판별할 때에는 5초간 촬영을 진행하며 0.5초마다 화면을 캡처하여 가장 높은 확률로 제시된 감정의 표정과 동일한 표정이라고 분류된 사진을 제공합니다. 마지막으로 Flutter 내 촬영된 영상을 제공하여 부모님이 확인할 수 있으며 기관에서도 참고할 수 있습니다.


### Contributors 👩‍💻👨‍💻
<a href="https://github.com/chaenni0312"><img src="https://img.shields.io/badge/chaenni0312-black?style=social-square&logo=github&logoColor=white"/></a>
<a href="https://github.com/KwonYeonghoo"><img src="https://img.shields.io/badge/KwonYeonghoo-black?style=social-square&logo=github&logoColor=white"/></a>
<a href="https://github.com/park-hyunbin"><img src="https://img.shields.io/badge/Park Hyunbin-black?style=social-square&logo=github&logoColor=white"/></a>
<a href="https://github.com/oceanstar777"><img src="https://img.shields.io/badge/oceanstar777-black?style=social-square&logo=github&logoColor=white"/></a>
<a href="https://github.com/chaksseu"><img src="https://img.shields.io/badge/chaksseu-black?style=social-square&logo=github&logoColor=white"/></a>
<a href="https://github.com/Hongjunior"><img src="https://img.shields.io/badge/Hongjunior-black?style=social-square&logo=github&logoColor=white"/></a>
