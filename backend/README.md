음성 데이터 텍스트 변환(whisper) : 추출한 음성 데이터를 텍스트 데이터로 변환하는 프로그램

-> 허깅페이스에 업로드한 모델을 'backend/stt/model_stt.py'에서 api로 받아와 실행


데이터 분석(CRR) : 입력된 텍스트 데이터를 평가하여 100점 만점으로 반환하는 알고리즘

-> 'backend/stt/crr.py'에서 실행


얼굴 및 감정 인식 (mediapipe + VGGNet) : mediapipe를 이용해 이미지에서 얼굴을 감지한 후 VGGNet 모델을 활용하여 감정을 예측하는 프로그램

-> 모델 위치 -> 'backend/facial_emotion_recognition/model_cv.py'

-> 학습 가중치 위치 -> 'backend/facial_emotion_recognition/vggnet_weight.h5'