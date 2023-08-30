# Backend

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