# 🌎 BridZe : 다문화가정 아동을 위한 언어와 정서 길잡이 서비스

## 다문화 아이들의 언어 및 정서 평가, 기관 연결 플랫폼 : 베트남 다문화가정을 중심으로

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
## 서비스 소개

BridZe는 정보 소외 대상자이자 디지털 소외 계층인 베트남 다문화가정 아동을 위한 언어와 정서 평가를 통한 기관 추천 서비스로, 다문화가정 아동의 발음과 읽기능력을 평가하고 아동의 표정과 유대관계를 평가하여 분석하고 언어 문제의 경우 언어 교육 기관으로, 정서 문제인 경우 심리 상담 기관을 추천해줍니다.
다문화가정 아동 혹은 한국 아동을 위한 언어 교육 기관과 심리 상담 기관은 국내에 많이 존재하고 있습니다. 그러나 한국 가정 부모님들과 달리 다문화가정 부모님들은 이러한 자원을 활용하기 위한 아동 관찰 및 정보 찾기를 통한 문제 해결이 어렵습니다. 따라서 다문화가정 아동들도 한국 아동들과 동일하게 제대로 된 환경에서 성장할 수 있도록 정보 소외 대상자인 이들이 아동을 직접 오랜 시간 관찰하고 정보를 찾아보지 않고도 기관을 이용할 수 있도록 BridZe 서비스가 개발되어야합니다.

---

## 데이터 모델 소개

- Whisper (STT 모델)
  : openai에서 오픈 소스로 공개한 Speech To Text(STT) 모델인 whisper은 2023년 7월 기준 가장 고성능의 STT 모델이었습니다. BridZe는 해당 모델의 성능을 올리고 베트남인이 한국어를 발화할 때 보이는 특성들을 반영하여 전사할 수 있는 STT 모델로 fine tuning을 진행하였습니다. 기존 모델의 경우 '아,어,음'과 같은 말더듬 표현을 교정하여 생략된 채로 음성 파일을 텍스트로 전사하였으나 발음의 어눌함과 읽기 능력을 평가해야하는 BridZe의 목적에 맞게 말더듬 표현까지 전사할 수 있도록 fine tuning을 진행하였습니다. 해당 모델은 BridZe 내 언어 평가에서 활용됩니다.

- Media pipe (CV 모델)
  : Inception-ResNet-v2 모델을 통해 표정을 분류하기 전에 Google의 Media pipe 기술로 얼굴 영역을 인식합니다.

- Inception-ResNet-v2 (CV 모델)
   - BridZe 서비스는 지속적인 검증체계를 거치고 기술 안전성 확보를 위하여 지속적으로 더 좋은 성능의 기술을 구축해왔습니다. 2023년 9월 18일 기준, 기존 VGGnet 모델보다 성능이 좋은 모델이 구축되어 Inception-ResNet-V2로 변경하였습니다.
  - : 기존 Inception-ResNet-v2 모델은 외국인의 얼굴을 잘 인식하고 표정을 잘 분류했지만 비교적 이목구비가 뚜렷하지 않은 동양인의 얼굴은 잘 인식하지 못하는 모습을 보였습니다. 다문화가정 아동들은 한국인 부모님과 타국가의 부모님 사이에서 태어난 아동들이기에 Inception-ResNet-v2 모델이 동양인의 얼굴과 표정 역시 잘 인식할 수 있도록 추가학습을 진행하였습니다. 해당 모델은 BridZe 내 정서 평가의 표정 평가 및 분류에서 활용됩니다.

---

# Whisper 파일 트리

```
📦data_STT, CV
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

```
AI Hub에서 제공한 외국인의 한국어 발화 데이터셋입니다.
'https://aihub.or.kr/aihubdata/data/view.do?currMenu=&topMenu=&aihubDataSe=realm&dataSetSn=505'에서 다운로드 가능합니다.
데이터의 수가 19만개가 넘어가 100개씩만 업로드하였습니다.
```

```
┣ 📂Whisper_finetuned
 ┃ ┣ 📂flagged
 ┃ ┣ 📂git-lfs-3.4.0(파일 생략)
 ┃ ┣ 📂Whisper_trained_model
 ┃ ┃ ┣ 📜.gitattributes
 ┃ ┃ ┣ 📜.gitignore
                . . .
 ┃ ┃ ┣ 📜vocab.json
 ┃ ┃ ┗ 📂runs
 ┃ ┣ 📜=0.30
 ┃ ┣ 📜=2.6.1
```

```
fine tuning된 Whisper 모델입니다.
Hugging Face에서 API형태로 언제든 불러 쓸 수 있습니다.
```

```
 ┃ ┗ 📜Whisper_코드.ipynb
```

```
fine tuning을 진행한 코드입니다.
fine tuning 과정의 검증이 필요하실 경우, 위 쪽의 전처리 코드는 모두 건너뛰고 중간의
`loaded_dataset_dict = DatasetDict.load_from_disk("/content/drive/MyDrive/bridze_data")`
이 코드부터 실행하시면 됩니다. (경로는 저장위치에 맞게 수정하시면 됩니다.)
```

- bridze_data는 이 [데이터셋](https://drive.google.com/drive/u/1/folders/11qAPKh_tbQM3x48KM_yYE1LZRKK_CNi3)을 다운받으시면 됩니다.
  - bridze data는 whisper모델에 투입하여 훈련할 수 있도록 가공이 완료된 데이터셋입니다.


---

# \[Deprecated\] VGGnet 파일 트리 

```
📦data_STT, CV
 ┣ 📂CV_preprocessing
 ┃ ┣ 📂dataset
 ┃ ┣ 📂pre_dataset
 ┃ ┣ 📜facecrop.ipynb
 ┃ ┣ 📜readme.txt
 ┃ ┗ 📜renaming.ipynb
 ┣ 📂CV_train
 ┃ ┣ 📂dataset
 ┃ ┃ ┣ 📜angry_aaabsuecbeeyjrkcgjku.jpg
 ┃ ┃ ┣ 📜angry_aaacuodmlyrbtkeqqnjmqbdwvonxbk.jpg
             . . .
 ┃ ┃ ┣ 📜sad_egllfut6ovrw44vxjhtmbsvd3gvwl6cam3g3fndyur.jpg
 ┃ ┃ ┗ 📜sad_eglpay54klutwg28ugwggon1ivqmjam1dvirfuq4vq.jpg
 ┃ ┣ 📜dataset.csv
 ┃ ┣ 📜vggnet_trained.h5
 ┃ ┣ 📜vggnet_trained.ipynb
 ┃ ┗ 📜vggnet_up.h5

```
---

# Inception-ResNet-v2 파일 트리

```
📦CV
 ┣ 📂dataset
 ┃ ┗ 📜dataset_drive_link.txt (원본:얼굴 부분이 crop된 .jpg 파일)
 ┣ 📂models
 ┃ ┗ 📜best_model_drive_link.txt (원본:모델의 가중치가 저장된 .h5 파일)
 ┣ 📂pickle_jar
 ┃ ┗ 📜pickle_jar_drive_link.txt (이미지와 증강을 완료한 jpg파일 정보를 담은 .pickle 파일)
 ┣ 📂pre_dataset (각 감정별로 ai hub 한국인 감정인식을 위한 복합 영상의 이미지 데이터 다운로드)
 ┃ ┣ 📂angry
 ┃ ┣ 📂fear
 ┃ ┣ 📂happy
 ┃ ┣ 📂neutral
 ┃ ┗ 📂sad
 ┣ 📜Tgram.py
 ┣ 📜bridzecv.yaml
 ┣ 📜dataset.csv
 ┣ 📜facecrop.ipynb
 ┣ 📜inception-resnet-v2.ipynb
 ┗ 📜renaming.ipynb

```

---

# 환경 설정

## Whisper 실행 환경

- Whisper fined tune 코드 : `data_STT, CV/Whisper_finetuned/Whisper_코드.ipynb`
- Whisper fine tuning에 사용된 데이터셋 : 인공지능 학습을 위한 외국인 한국어 발화 음성 데이터의 베트남 도메인 19만 데이터
  - 해당 데이터셋의 전체 버전은 [ai hub](https://www.aihub.or.kr/aihubdata/data/view.do?currMenu=115&topMenu=100&aihubDataSe=realm&dataSetSn=505)에서 다운이 가능합니다.
- Whisper 구동 환경 : pytorch , cuda 를 설치합니다.
  - 설치 방법 참조 : https://pytorch.org/get-started/previous-versions/
- Whisper 사용 방법 : 위 코드가 문제없이 끝까지 실행된다면, 저희 Hugging Face repository에 손실값과 cer오류율이 가장 작은 모델이 저장되고, API 형태로 언제든 불러서 쓸 수 있습니다.

```python
pipe = pipeline(model="oceanstar/bridze")
pipe(audio_file)['text']
위와 같이 모델을 불러 사용할 수 있습니다.
```

### <중요> Whisper 실행시 주의사항
```python
from huggingface_hub import notebook_login

notebook_login()
```
해당 코드 실행 시

- 토큰 : `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`
  - 이 토큰을 넣어야 저희가 fine tuning한 모델을 쓸 수 있습니다.

---

## \[Deprecated\] VGGnet 실행 환경

- VGGnet 추가 학습 코드 : `CV_preprocessing 폴더 내의 코드들`
  - 한글 파일명이 깨지므로 renaming으로 랜덤한 이름으로 변경합니다. 그 뒤 `face crop.ipynb`로 얼굴부분만 crop합니다.
- VGGnet 추가 학습에 사용된 데이터셋 : 한국인 감정인식을 위한 복합 영상의 이미지 데이터
  - 해당 데이터를 활용하여 imblearn의 SMOTE 기법으로 각 감정별 1만 데이터로 증강시켜 학습을 진행하였습니다.
  - 해당 데이터셋의 전체 버전은 [ai hub](https://www.aihub.or.kr/aihubdata/data/view.do?currMenu=115&topMenu=100&aihubDataSe=realm&dataSetSn=82)에서 다운이 가능합니다.
- VGGnet 구동 환경 :
  - os: Ubuntu 18.0.4
  - vga : geforce rtx2080 super
  - cuda 11.8
  - 필요 라이브러리는 requirements.txt에 기록되어있습니다. cmd 프롬프트 명령어
    `pip install -r requirements.txt`
    로 필요 라이브러리를 설치할 수 있습니다.
- VGGnet 사용 방법 (데이터 불러오기) :
  - dataset.csv파일 내에 dataset폴더의 경로 및 jpg파일 명이 기록되어있습니다.
  - dataset 폴더 내에 있는 jpg파일과 csv파일의 라벨링된 감정을 함께 불러옵니다.
  - 데이터양이 불균형할 경우 학습이 제대로 되지않으므로 upsamling을 통해 균형을 맞춰줍니다.
  - vggnet모델의 checkpoint의 가중치는 vggnet_up.h5 파일로 최종 모델의 가중치는 vggnet_trained파일로 저장됩니다.
  - 모델의 가중치는 플러터 환경으로 이동하고 촬영한 사진들을 가중치가 적용된 모델을 통해 추론하는 방식으로 진행됩니다.

---

## Inception-ResNet-v2 실행 환경

- 한글 파일명이 깨지므로 `renaming.ipynb`으로 랜덤한 이름으로 변경합니다. 그 뒤 `facecrop.ipynb`로 얼굴부분만 crop합니다.
- [Imagenet](https://en.wikipedia.org/wiki/ImageNet)으로 사전학습된 모델을 가져와 전이학습과 파인튜닝을 진행하였습니다.
- Inception-ResNet-v2 전이 학습에 사용된 데이터셋 : 한국인 감정인식을 위한 복합 영상의 이미지 데이터
  - 해당 데이터를 활용하여 imblearn의 SMOTE 기법으로 각 감정별 7만 8천 데이터로 증강시켜 학습을 진행하였습니다.
  - 해당 데이터셋의 전체 버전은 [ai hub](https://www.aihub.or.kr/aihubdata/data/view.do?currMenu=115&topMenu=100&aihubDataSe=realm&dataSetSn=82)에서 다운이 가능합니다.
- 총 42만장의 한국인 얼굴 데이터 사진을 이용하여 학습을 진행하였습니다.
- Inception-ResNet-v2 구동 환경 :
  - OS: Ubuntu 22.04
  - Vga : geforce rtx4090
  - Ram : 64gb
  - CUDA-version : 11.8
  - cuDNN-version : 8.9.4
  - 가상환경 라이브러리는 bridzecv.yaml에 기록 되어있습니다.

```bash
  conda env create -f bridzecv.yaml
```

- 위 명령어로 필요 가상환경을 설치 할 수 있습니다.
- Inception-ResNet-v2 사용 방법 (데이터 불러오기) :
  - dataset.csv파일 내에 dataset폴더의 경로 및 jpg파일 명이 기록되어있습니다.
  - dataset 폴더 내에 있는 jpg파일과 csv파일의 라벨링된 감정을 함께 불러옵니다.
  - 데이터양이 불균형할 경우 학습이 제대로 되지않으므로 upsampling을 통해 균형을 맞춰줍니다.
  - Inception-ResNet-v2 모델의 가중치는 best_model.h5 파일로 저장됩니다.
  - 모델의 가중치는 플러터 환경으로 이동하고 촬영한 사진들을 가중치가 적용된 모델을 통해 추론하는 방식으로 진행됩니다.

---

## 프론트엔드 개발 환경

- <중요> 로그인의 아이디와 비밀번호는 다음과 같습니다 !
  아이디 : daitso
  비밀번호 : 1234
- Dart 언어 기반의 Flutter
- Flutter 설치 하기 : https://docs.flutter.dev/get-started/install
- 코드 구동하기
  - vscode나 androidstudio에서 device를 chrome으로 설정합니다.
  - 터미널에 flutter pub get 입력 후 main.dart를 디버깅합니다.
- main.dart 위치 : `bridze/lib/main.dart`

## 백엔드 개발 환경

- 구름IDE의 컨테이너에서 flask를 기반으로 개발했습니다.
- 구름 컨테이너 링크: https://goor.me/WWGQVkghsxv5sAL1A
- Bridze 프로젝트에 필요한 백엔드 웹 서버는 구름IDE의 '항상 켜두기' 기능을 이용하여 별도로 항상 실행 중입니다. 따라서 Bridze 프로젝트를 실행하기 위해 추가로 백엔드 서버를 실행하실 필요는 없습니다.
- 로컬에서 서버를 따로 실행시키는 방법 및 기타 자세한 내용은 `backend/README.md`를 참고바랍니다.

---

# 최종 모델 성능 결과

| 모델                             | 정확도 |
| -------------------------------- | ------ |
| openai whisper                   | 80.7   |
| BridZe fine tuned whisper        | 92.7   |
| fer2013 데이터셋 VGGnet          | 93.2   |
| ai hub 데이터셋 VGGnet (5만 ver)_2023.09.04 최종 선택 모델 | 77.1   |
| ai hub 데이터셋 Inception-ResNet-v2 (42만 ver)_2023.09.18 최종 선택 모델 | 80.4   |

- openai whisper은 기존에 공개된 오픈 소스 코드의 정확도이며 BridZe fine tuned whisper은 저희 팀이 직접 fine tuning하여 목적에 맞게 새로이 구축된 모델의 정확도입니다.
- VGGnet 모델의 경우 정확도가 무의미합니다.
  - VGGnet 모델의 경우, 동일한 코드이더라도 사용하는 데이터셋에서 따라 정확도가 유동적입니다. 저희 팀이 직접 추가학습을 시킨 결과 Kaggle의 fer2013 인물 데이터로는 93.2의 정확도를 가진 모델이 구축되었으나 실시간으로 동양인의 얼굴 표정을 분류하고자 하였을 때 잘 분류되지 않는 모습을 보였습니다. 이에 따라 데이터셋을 ai hub의 한국인 감정인식을 위한 복합 영상 데이터셋으로 변경하였고 정확도는 fer2013 데이터보다 낮으나 실시간 얼굴 표정 분류에서는 훨씬 뛰어난 성능을 보여 ai hub 데이터셋 VGGnet 모델로 최종 결정하였습니다. (2023년 9월 4일 기준)

![image](https://github.com/BridZe/bridze/assets/89845380/1548aeae-e261-4711-bd79-299cd5b981e6)

- 참고 : fer2013 데이터셋으로 학습시킨 결과화면의 캡처본입니다. 최종적으로 선정된 ai hub 데이터셋으로 학습시킨 결과는 아래 Vggnet 성능 결과에서 확인하실 수 있습니다.
- fer2013 데이터셋은 [Kaggle](https://www.kaggle.com/datasets/msambare/fer2013)에서 다운 가능합니다.

- Inception-ResNet-v2 모델의 경우, 각 감정별 7만 8천 데이터로 추가학습을 진행하여 총 42만 데이터를 추가 학습시킨 모델입니다. 보다 많은 이미지 데이터 학습양으로 기존 VGGnet 모델보다 전반적으로 높은 정확도를 보였으며 해당 모델로 최종 선정하게 되었습니다. (2023년 9월 18일 기준)

# whisper 성능 결과

| step | training loss | validation loss | cer(글자 단위 오류율) |
| ---- | ------------- | --------------- | --------------------- |
| 1500 | 0.221         | 0.238           | 9.3                   |
| 2000 | 0.225         | 0.219           | 8.6                   |
| 2500 | 0.194         | 0.206           | 7.5                   |
| 3000 | 0.139         | 0.196           | 7.3                   |
| 3500 | 0.178         | 0.190           | 7.5                   |
| 4000 | 0.163         | 0.188           | 7.3                   |

- 4000스텝까지의 학습 중 check point를 통해 최고 성능의 3000스텝의 모델을 저장하였습니다.
- 3000스텝에서의 loss 값이 0.18로 존재하나 과적합이라고 보기 어려운 미세한 loss값이며 새로운 test 데이터셋으로 확인한 결과 과적합이 일어나지 않는 모델임을 확인했습니다.

# VGGnet 성능 결과 (Deprecated)

---

| 감정         | 정확도 |
| ------------ | ------ |
| 화남         | 69.0   |
| 불안(두려움) | 66.7   |
| 행복         | 95.0   |
| 무표정       | 82.3   |
| 슬픔         | 80.3   |
| 전체         | 77.1   |

- VGGnet은 새로운 데이터셋으로 평가되는 정확도의 숫자보다는 실제 촬영 시 표정 분류 정확도가 더 중요하다는 전문가의 조언을 받아 수차례 실험을 진행하였습니다. 이는 최종적으로 선정된 모델의 성능 결과표입니다.
- 실시간 표정 분류의 정확성을 높이기 위하여 촬영된 영상의 표정을 0.5초마다 캡처하여 가장 높은 확률로 제시된 표정과 동일한 표정을 지은 사진을 표정 평가 및 분류에 활용하고 있습니다.


# Inception-ResNet-v2 성능 결과 (CV 최종 선정 모델 - 2023.09.18)
  
---

| 감정         | 정확도 |
| ------------ | ------ |
| 화남         | 74.5  |
| 불안(두려움) | 74.2   |
| 행복         | 97.0   |
| 무표정       | 90.3   |
| 슬픔         | 76.4   |
| 전체         | 80.4   |

- VGGnet과 동일하게 정확도의 숫자보다는 실제 촬영 시 표정 분류 정확도가 더 중요합니다. 해당 모델은 정확도의 숫자 뿐 아니라 실제 촬영 시 표정 분류에서도 2023.09.04에 최종 결정되었던 VGGnet 모델보다 우수한 성능을 보였습니다. 이는 최종적으로 선정된 모델의 성능 결과표입니다.
- 전체적인 정확도가 3.3% 기존 최종 모델보다 상승했습니다. 작은 수치로 느껴지실 수 있으나 큰 성능의 변화가 있어 해당 모델로 최종 변경하기로 결정하였습니다.
- 실시간 표정 분류의 정확성을 높이기 위하여 촬영된 영상의 표정을 0.5초마다 캡처하여 가장 높은 확률로 제시된 표정과 동일한 표정을 지은 사진을 표정 평가 및 분류에 활용하고 있습니다.
  
# 모델과 서비스 연결

## Frontend

### 평가 과정 안내

![평가과정안내](https://github.com/BridZe/bridze/assets/89845380/65a1a7d8-7b9c-4f46-9811-f414970c392f)

토리찌라는 캐릭터가 전반적인 평가 과정(언어 평가 과정, 정서 평가 과정)에 대해 음성을 통해 안내합니다.

- 평가 안내 파일 위치 : `lib/screen/diagnosis_home.dart`

### 로그인

![image](https://github.com/BridZe/bridze/assets/89845380/4525aee1-12b2-4848-9842-28e9e466cb0f)

아이디 : daitso
비밀번호 : 1234

### 언어 평가 과정

![5-7](https://github.com/BridZe/bridze/assets/89845380/59e41cbf-e224-4ee6-abdc-7f848d647aa0)

화면에 주어진 문장을 아동이 녹음을 합니다.

![부모님 언어](https://github.com/BridZe/bridze/assets/89845380/a90897a7-8695-4846-b736-8e2b6c3e9653)

화면에 주어진 문장을 부모님이 녹음을 합니다.

- 언어 평가 파일 위치 : `lib/screen/diagnosis/`

### 정서 평가 과정

![유대관계 평가](https://github.com/BridZe/bridze/assets/89845380/f04757b4-f960-458a-9419-61979575d074)
![인터뷰](https://github.com/BridZe/bridze/assets/89845380/87194c89-7178-4351-b4b7-fe9f34cd32ae)

화면을 통해 유대관계 평가를 진행하고, 아동의 인터뷰를 녹화합니다.

- 정서 평가 파일 위치 : `lib/screen/diagnosis_face/`

![행복한 표정](https://github.com/BridZe/bridze/assets/89845380/c9ccdd90-c388-4c2a-b7f0-eff433360dfc)
![행복한 표정2](https://github.com/BridZe/bridze/assets/89845380/628b771a-d1b2-468f-994f-3bcf1e85de02)

아동의 표정을 사진으로 분류합니다.

- 2번째 정서 평가(부모님을 위한 표정 분류표 제공) 파일 위치 : `lib/diagnosis_face2/`

### 평가 결과

<img width="1129" alt="스크린샷 2023-09-04 오후 12 24 06" src="https://github.com/BridZe/bridze/assets/89845380/e645df51-66ea-4142-b93e-442d4fb2c87b">

언어 평가 결과를 차트를 통해 제공합니다. 서버에 저장된 CRR 알고리즘을 통해 분류된 기준에 따라 상, 중, 하로 분류됩니다.

- 차트 파일 위치 : `lib/chart/chart_language.dart`

![정서 평가 결과](https://github.com/park-hyunbin/BridZe_datacampus/assets/89845380/d846c8d7-8123-4842-9e1d-8c82c5adff66)

정서 평가 결과를 차트를 통해 제공합니다. 유대관계 점수 데이터가 provider에 저장되고 분류된 기준에 따라 상, 중상, 중하, 하로 분류됩니다.

- 차트 파일 위치 : `lib/chart/chart_face.dart`
- provider 위치 : `birdze/lib/provider/provider.dart`

![감정을 나타내는 표정들 ](https://github.com/BridZe/bridze/assets/89845380/f2b9eb7f-3bc7-4615-aa65-582672acbeec)
![비디오](https://github.com/BridZe/bridze/assets/89845380/d3a77fa9-8331-49f3-aa9d-4cfd100243db)

아동의 표정을 분류하고, 아동의 인터뷰 답변 녹화 영상을 저장합니다.

- 표정이 분류된 사진 저장 위치 : `lib/save/picture_save.dart`
- 인터뷰 비디오 저장 위치 : `lib/save/video_save.dart`

![기관 추천](https://github.com/BridZe/bridze/assets/89845380/0b13d4ff-d650-474c-92b4-9768d7e44cc7)

기관 추천 알고리즘을 제공합니다. 임계치에 따라 분류된 언어 평가(상,중,하)와 정서평가(상,중상,중하,하)에 맞는 아동 맞춤 기관을 제공합니다.
본인이 원하는 지역을 선택하면 해당 지역의 맞춤 기관을 추천받을 수 있습니다.

- 알고리즘 파일 위치: `/bridze/lib/institution.dart`

## Backend

백엔드(flask)에서는 프론트엔드(flutter)와 상호작용하며 음성 및 이미지 데이터 관련 다양한 작업을 처리합니다. 음성을 텍스트로 변환하는(STT) 기능, Character Recognition Rate (CRR) 점수 산정, 비디오 프레임 추출, 이미지 감정 분석 등의 기능을 지원합니다.

- flask 파일 위치: `/bridze/backend/application.py`

## 1. 음성 데이터 텍스트 변환 (Whisper)

음성 데이터를 텍스트 데이터로 변환합니다. 해당 기능은 Hugging Face에 업로드한 모델 API를 받아 사용합니다.

- 모델 실행 위치: `/bridze/backend/stt/model_stt.py`
- Hugging Face 모델 주소: https://huggingface.co/oceanstar/bridze

## 2. 데이터 분석 (CRR)

입력된 텍스트 데이터를 저장된 지정발화 문장으로 평가하여 100점 만점으로 반환하는 알고리즘입니다.

- 알고리즘 실행 위치: `/bridze/backend/stt/crr.py`

## 3. 얼굴 및 감정 인식 (Mediapipe + Inception-ResNet-v2)

Mediapipe를 사용하여 얼굴을 감지하고, 학습된 Inception-ResNet-v2 모델을 활용하여 감지된 얼굴의 감정을 예측합니다.

- 학습 모델 파일: `/bridze/backend/facial_emotion_recognition/best_model.h5`
- 모델 실행 위치: `/bridze/backend/facial_emotion_recognition/model_cv.py`

## 4. 동영상 프레임 추출

OpenCV를 사용하여 동영상 파일을 읽고 지정된 간격으로 프레임을 추출하여 이미지로 저장합니다. 추출된 프레임은 `frames` 폴더에 저장됩니다.

- 알고리즘 실행 위치: `/bridze/backend/videos/video2frame.py`

---

## 서비스 흐름도 및 시스템 구성도

![image](https://github.com/BridZe/bridze/assets/89845380/891b9549-15de-49c8-97bf-210d665812cc)

## 언어 평가 과정

![image](https://github.com/BridZe/bridze/assets/89845380/2eabfb23-7941-4294-ba15-5e00932a8764)
아동의 나이에 맞는 수준의 지정 발화를 읽어 Flutter 내에서 음성 녹음을 진행합니다. 음성이 녹음되면 해당 음성 파일은 whisper 모델 안에서 전처리와 토큰화를 거쳐 텍스트로 전사되고 정답셋과 비교하여 글자 단위 비교 알고리즘인 CRR 알고리즘을 통해 100점 만점으로 환산되어 점수를 받게 됩니다. 받은 점수는 AI HUB의 한국어 아동 음성 데이터, 어린이 음성 데이터를 통해 계산된 통계 기반 임계치로 상, 중, 하로 결과를 받게 됩니다. 베트남 부모님도 이와 동일한 방식으로 언어 평가를 받게 됩니다.

### 아동 임계치

| 나이        | 상       | 중      | 하     |
| ----------- | -------- | ------- | ------ |
| 5세 - 7세   | 100 ~ 88 | 87 ~ 69 | 68 ~ 0 |
| 8 - 10세    | 100 ~ 91 | 90 ~ 73 | 72 ~ 0 |
| 11세 - 13세 | 100 ~ 97 | 96 ~ 76 | 75~ 0  |

### 부모 임계치

| 상     | 중    | 하     |
| ------ | ----- | ------ |
| 100~97 | 96~89 | 88 ~ 0 |

## 정서 평가 과정

![image](https://github.com/BridZe/bridze/assets/89845380/7a4ebc37-8480-4e4e-a020-ab4145d88f44)
다문화가정 아동이 검증된 테스트지를 바탕으로 한 질문 5개에 답을 합니다. 답변은 임의의 가중치에 의해 100점 만점으로 환산되어 저장됩니다. 기존 테스트지의 기준에 따라 상, 중상, 중하, 하 4단계로 나누어 평가받게 됩니다. 유대관계 테스트지에 답하는 중간중간 BridZe의 캐릭터 토리찌가 부모님과 관련된 질문을 하고 아동은 이에 답하게 됩니다. Flutter 내에서 화면이 녹화되는 동안 Mediapipe 기술로 얼굴을 인식하여 잡아내고 Inception-ResNet-v2이 해당 범위 내에서 아동의 표정이 '행복, 슬픔, 화남, 불안(두려움), 무표정' 중 어떠한 표정인지를 판단하여 부모님에 대한 질문에 답할 때의 주된 표정이 무엇인지를 테스트 점수와 함께 제공합니다. 이어, 언어적인 소통이 안되는 관계일수록 비언어적인 요소를 파악하여 유대관계를 형성하는 것의 중요성은 높아집니다. 이러한 이유로 의사소통이 어려운 베트남 부모님과 다문화가정 아동의 좋은 유대관계 형성을 위하여 아동의 5가지 표정 모음집을 위와 동일한 방식으로 Mediapipe와 Inception-ResNet-v2을 통해 분류해 제공하도록 합니다. 표정을 판별할 때에는 5초간 촬영을 진행하며 0.5초마다 화면을 캡처하여 가장 높은 확률로 제시된 감정의 표정과 동일한 표정이라고 분류된 사진을 제공합니다. 마지막으로 Flutter 내 촬영된 영상을 제공하여 부모님이 확인할 수 있으며 기관에서도 참고할 수 있습니다.

### Contributors 👩‍💻👨‍💻

<a href="https://github.com/chaenni0312"><img src="https://img.shields.io/badge/chaenni0312-black?style=social-square&logo=github&logoColor=white"/></a>
<a href="https://github.com/KwonYeonghoo"><img src="https://img.shields.io/badge/KwonYeonghoo-black?style=social-square&logo=github&logoColor=white"/></a>
<a href="https://github.com/park-hyunbin"><img src="https://img.shields.io/badge/Park Hyunbin-black?style=social-square&logo=github&logoColor=white"/></a>
<a href="https://github.com/oceanstar777"><img src="https://img.shields.io/badge/oceanstar777-black?style=social-square&logo=github&logoColor=white"/></a>
<a href="https://github.com/chaksseu"><img src="https://img.shields.io/badge/chaksseu-black?style=social-square&logo=github&logoColor=white"/></a>
<a href="https://github.com/Hongjunior"><img src="https://img.shields.io/badge/Hongjunior-black?style=social-square&logo=github&logoColor=white"/></a>
