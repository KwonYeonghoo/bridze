# **_중요_**

## whisper

```
from huggingface_hub import notebook_login

notebook_login()
```

- 해당 코드 실행 시
  - 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
  - 이 토큰을 넣어야 저희가 finetuning한 모델을 쓸 수 있습니다

---

## CV

- 이미지 원본 파일은 [ai hub - 한국인 감정인식을 위한 복합 영상](https://www.aihub.or.kr/aihubdata/data/view.do?currMenu=115&topMenu=100&aihubDataSe=realm&dataSetSn=82)에서 받을 수 있습니다.
- dataset, best_model.h5, pickle_jar는 용량이 커 구글드라이브 링크를 .txt파일로 첨부 하였습니다 각 경로에 있는 링크로 다운받으셔야 합니다.
- 가상환경 라이브러리는 bridzecv.yaml에 기록 되어있습니다.

```
conda env create -f bridzecv.yaml

```

- 위 명령어로 필요 가상환경을 설치 할 수 있습니다.

- Tgram.py 는 텔레그램을 통해 훈련 중 에러나 완료를 텔레그램 봇으로 알립니다.

- 실행순서는 다음과 같습니다.
  - [ai hub](https://www.aihub.or.kr/aihubdata/data/view.do?currMenu=115&topMenu=100&aihubDataSe=realm&dataSetSn=82)에서 pre_dataset 폴더에 감정별로 원본 파일 다운로드
  - dataset/, pickle_jar/ , models/ 에 있는 구글 드라이브 링크를 통해 파일 다운로드
  - bridzecv 가상환경 설치
  - renaming.ipynb 실행 한글 파일명이 깨짐을 방지
  - facecrop.ipynb 로 얼굴추출
    - 추출이 완료된 데이터는 구글 드라이브 링크를 첨부하였습니다.
  - inception-resnet-v2.ipynb 실행 후 모델 훈련 및 평가
    - 빠른 실행을 위해 이미지를 처리한 pickle 파일을 사용할 수 있습니다.
    - pickle_jar 폴더 내에 구글 드라이브 링크를 첨부하였습니다.
