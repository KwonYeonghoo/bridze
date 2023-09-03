# Backend

백엔드(flask)에서는 프론트엔드(flutter)와 상호작용하며 음성 및 이미지 데이터 관련 다양한 작업을 처리합니다. 음성을 텍스트로 변환하는(STT) 기능, Character Recognition Rate (CRR) 점수 산정, 비디오 프레임 추출, 이미지 감정 분석 등의 기능을 지원합니다.
- flask 파일 위치: `/bridze/backend/application.py`

## 백엔드 디렉토리 구조
```
backend
 ┣ facial_emotion_recognition
 ┃ ┣ inference
 ┃ ┃ ┣ angry
 ┃ ┃ ┃ ┗ picture.jpg
 ┃ ┃ ┣ fear
 ┃ ┃ ┃ ┗ picture.jpg
 ┃ ┃ ┣ happy
 ┃ ┃ ┃ ┗ picture.jpg
 ┃ ┃ ┣ neutral
 ┃ ┃ ┃ ┗ picture.jpg
 ┃ ┃ ┗ sad
 ┃ ┃ ┃ ┗ picture.jpg
 ┃ ┣ model_cv.py
 ┃ ┗ vggnet_weight.h5
 ┣ stt
 ┃ ┣ crr.py
 ┃ ┣ Jijeong.py
 ┃ ┣ model_stt.py
 ┃ ┗ test.flac
 ┣ videos
 ┃ ┣ chart
 ┃ ┃ ┗ picture.jpg
 ┃ ┣ video1.mp4
 ┃ ┣ video2.mp4
 ┃ ┣ video2frame.py
 ┃ ┗ video3.mp4
 ┣ application.py
 ┣ README.md
 ┗ requirements.txt
```
## Bridze Backend 실행 방법

**중요:** Bridze 프로젝트에 필요한 백엔드 웹 서버는 구름IDE의 '항상 켜두기' 기능을 이용하여 별도로 항상 실행 중입니다. 따라서 Bridze 프로젝트를 실행하기 위해 별도로 백엔드 서버를 실행하실 필요는 없습니다.
- 구름 컨테이너 링크: https://goor.me/WWGQVkghsxv5sAL1A

아래 방법은 로컬 컴퓨터에서 Bridze의 백엔드 서버 기능만 따로 실행하는 방법입니다. 직접 실행한 백엔드 서버를 Bridze의 프론트엔드와 연결하려면 프론트엔드 내부의 URL들을 실행시키신 서버 주소로 변경해야 합니다. 
(+ backend\facial_emotion_recognition\model_cv.py의 weights 경로를 절대 경로로 변경해야합니다.)

### 1. 깃 클론 이후 backend 폴더에 들어갑니다:
```bash 
git clone https://github.com/BridZe/bridze.git
cd bridze/backend
```
### 2. 가상 환경을 생성하고 활성화합니다:
```bash 
py -3.8 -m venv backenv
backenv\Scripts\activate
```
### 3. 프로젝트에 필요한 패키지들을 설치합니다:
```bash 
python.exe -m pip install --upgrade pip
pip install -r requirements.txt
```
### 4. Flask 애플리케이션을 실행할 환경 변수를 설정합니다:
```bash 
set FLASK_APP=application
set FLASK_ENV=development
```
### 5. Flask 애플리케이션을 실행합니다:
```bash 
flask run
```

## 백엔드 주요 기능

### 1. 음성 데이터 텍스트 변환 (Whisper)

음성 데이터를 텍스트 데이터로 변환합니다. 해당 기능은 Hugging Face에 업로드한 모델 API를 받아 사용합니다. 

- 모델 실행 위치: `/backend/stt/model_stt.py`
- Hugging Face 모델 주소: https://huggingface.co/models/oceanstar/bridze (수정필요)

### 2. 데이터 분석 (CRR)

입력된 텍스트 데이터를 저장된 지정발화 문장으로 평가하여 100점 만점으로 반환하는 알고리즘입니다.

- 알고리즘 실행 위치: `/backend/stt/crr.py`

### 3. 얼굴 및 감정 인식 (Mediapipe + VGGNet)

 Mediapipe를 사용하여 얼굴을 감지하고, 학습된 VGGNet 모델을 활용하여 감지된 얼굴의 감정을 예측합니다.

- 학습 모델 파일: `/backend/facial_emotion_recognition/vggnet_weigt.h5`
- 모델 실행 위치: `/backend/facial_emotion_recognition/model_cv.py`

### 4. 동영상 프레임 추출

OpenCV를 사용하여 동영상 파일을 읽고 지정된 간격으로 프레임을 추출하여 이미지로 저장합니다. 추출된 프레임은 `frames` 폴더에 저장됩니다.

- 알고리즘 실행 위치: `/backend/videos/video2frame.py`
