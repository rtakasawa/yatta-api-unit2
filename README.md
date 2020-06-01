# README

# yatta

## 概要
学習教材（書籍等）の進捗を管理するサービス。  
書籍を購入したが、途中まで学習して、そのまま放置している。  
どこまでやったか覚えてない。どんな教材を買ったか忘れた。  
このアプリに教材の情報を登録し、どこまで学習したかを管理することができます。

## コンセプト
学習教材の登録機能。  
教材（書籍）の登録を容易にするため、書籍関連のWEBAPIを使って、アプリ上で登録したい書籍の情報を検索し、登録することができます。

## バージョン
rails 5.2.4  
ruby 2.6.5

## 使用予定Gem
* devise
* devise-i18n
* letter_opener_web
* rails_admin
* cancancan
* rakuten_web_service
* dotenv-rails
* pry-rails
* better_errors
* binding_of_caller
* ransak
* kaminari
* rspec-rails
* spring-commands-rspec
* factory_bot_rails
* faker
* launchy
* capybara
* webdrivers
* rspec-retry

## 機能一覧
- [ ] ログイン機能
- [ ] ユーザー登録機能
- [ ] ユーザー退会機能
- [ ] 教材一覧表示機能
  - [ ] 検索機能、ソート機能
  - [ ] 学習一覧表示機能
- [ ] 教材投稿機能
- [ ] 教材検索機能（書籍のみ）
- [ ] 教材編集機能
- [ ] 教材削除機能
- [ ] 学習情報：新規登録機能
- [ ] 学習情報：編集機能
- [ ] 学習情報：削除機能
- [ ] 管理者機能 

## カタログ設計
https://docs.google.com/spreadsheets/d/1EadlG8ahRm3GO1utmveANxjhM0nsd7jPzDd4wtjiiZ4/edit?usp=sharing

## テーブル定義
https://docs.google.com/spreadsheets/d/1EadlG8ahRm3GO1utmveANxjhM0nsd7jPzDd4wtjiiZ4/edit?usp=sharing

## ER図・画面遷移図・画面ワイヤーフレーム
https://app.diagrams.net/?lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=%E5%8D%92%E6%A5%AD%E8%AA%B2%E9%A1%8C%EF%BC%9AER%E5%9B%B3%E3%83%BB%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3%E3%83%BB%E3%83%AF%E3%82%A4%E3%83%A4%E3%83%BC%E3%83%95%E3%83%AC%E3%83%BC%E3%83%A0_200601%E4%BF%AE%E6%AD%A3.drawio#R%3Cmxfile%20pages%3D%2211%22%3E%3Cdiagram%20id%3D%22C5RBs43oDa-KdzZeNtuy%22%20name%3D%22ER%E5%9B%B3%22%3E7VpbU9s4FP41mdl9gHHixEkecUroQthJuRT2qSNixVaRLSMrTcyv36NY8gWTi8Fp6dQMM1ifj3Wscz6di0zLHPmrM45C75I5mLY6hrNqmZ9anU67Yw7gj0TiBLHa3QRwOXGUUAZck2esQEOhC%2BLgqCAoGKOChEVwxoIAz0QBQ5yzZVFszmhRa4hcpdHIgOsZorgkdkcc4SXooNPP8M%2BYuJ7W3LaGyR0faWE1ceQhhy1zkHnaMkecMZFc%2BasRptJ42i53%2F8R3dPJonZ1%2FiZ7QrX1x8%2B%2FXo2SycZVH0iVwHIg3T%2F38OB9%2F%2Ftr9fh9Ox1%2BWxtnJw%2FnRUU%2FN%2FQPRhTLYbYS5WrCItRWjJfEpCmBkz1kgrtWdNoxnHqHOBMVsId8tEmj2qEe2xzh5BnlElTDc5kKRpGMVJK7lkwAbgHIcgcxUL7idQhMUCSUzY5SiMCIP6Zv4iLsksJkQzNcTsUXgYEeNUg%2BuB4Kzx5QT8vk9zaxNhrnAqxzJlNnPMPOx4DGI6LuW2jKx3lSKYsuMkG1LsczLk1FTD6lN4KZzp%2BquYNOgwAUjpPr0U0rdwNhPG%2FijoAxRgXmABLalEaM8ueAit9AMWlOuCv06JfqBfIl8HgrlJXhGEESzFZu2YKFyJ8VzzQyu1iSvHzQbpIMRJW4A14msLT1IIFKcKHg9mT0nlI4YZRyQgK0pH4VoRgJ3kqjoGhl0pVR1AWIw35yu%2BeURx8HBmn8CCZRQVD4WMhKItX17NvyCF0bGca%2FVg2WOYNzOxvArxbkYsQCoisiakxj4v8RyD9gOZ%2BENMB6ny67C9fwuNsrE3x4sdjM%2FLlKqKvXyPC9wrjLBzBLBphfvJthDPsS8wpe9ePaCVHVxahdt5Bo3xrvtm%2FSl29OkrV6mkBcLdMj537R%2Bpvu7JfcHyIdQCQrNtjQe9hGhuXGIomjJuJODkOOT4DBByWiC0vYEXFMc0hTeFYeswaGI2CsRsYlC1Zze3eD02qLQ4ZxvlZx%2FCWUVByc3hXadhXbXKFa%2Baf28s9Duv63Qtn6fSrv%2FaqWdJrkFdH3fiPPX%2BOLvpv7%2BqPW3tfeGqFh%2Fd7uHCn2Dpv5%2Bd%2Bbrb3B7bZnvcO4fltwviKD5AhwtBKSmHDCDOOgyqTxXlMPbZ8OACdzU4z8pSOlVgvHHYwN%2BKhC3crzq75uvjS35%2Bl2M1dqaQv3N4Wq4weu1havh8HhY%2BHk%2FF2z2LQxX3u05n90%2BPfmsc3R7f1QumUpUwI6LdRoHK3rMZQGipxn6YsNlMhO2poo07HcsRKxqdQiHTFbrwi9U8ifySwgAp1fPmLMbdomCWN8bE6plwTM8vpe6jnudngb%2Bk3ePjVTg00q9TTKK86MptCVgPcxT0Ml0J3QFSKl8PRZsq%2BUjtuAzvG3%2FqVQkdNDaRTPpga2hhWOKBPlR%2FBy0pc6fyv2R6ykGZqHGN1%2BGnuRN1VP1F%2B5W%2BQjrWiyc%2BM%2FsHPfPSHV1lMVPN%2Ba%2BLV67V0tHuXdG%2FAUtpVU%2B0yq0lL4642jayo%2FdVlqbTtY%2BbltplU%2FUmrayYp2Wbt%2Ffr620ypXZOmvlv%2BsE%2BVAECxLSGhkC8mIRNV3kx%2B8iq4enfXPm4GBNZPnUqwlO1YLTwc%2B86nD%2Bq11j%2BcjrA3SNKrjk2sVSc1doLLMer%2Fr3mp09nv4au7vH69fd423wLAyz%2F%2BNL6uPsvyHN0%2F8B%3C%2Fdiagram%3E%3Cdiagram%20id%3D%224c3VfqMWapm_xh-j7Nmg%22%20name%3D%22%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3%22%3E7V3bets2En4aXkofCYAgcCnJcrrbpEmadJv0TrYYWV1ZdGm5tvv0C5AEDwB4FEFRXuUmMgiAOMw%2FMxjMDC24uH95F64e7j4Ea39nAXv9YsErCwAIbcj%2B4yWvSYmLcVyyCbfruMzJCr5s%2F%2FGTQjspfdqu%2FcdCxUMQ7A7bh2LhbbDf%2B7eHQtkqDIPnYrUfwa741ofVxlcKvtyudmrp79v14S4uJcDLyn%2Fyt5s78WYH0%2FjJ%2FUpUTmbyeLdaB8%2B5Iri04CIMgkP86%2F5l4e%2F46ol1efzD%2F%2FU7%2Bog%2Ffl6s%2F33Am8%2B%2FvN9M4s6u2zRJpxD6%2B0O%2FXaO4679Xu6dkvSyAd%2Bwl88Pqhi0hsG%2BCcO2H0TP81xOf69zJfrIKz%2Bmqps9tNhK3UOmWjeVhtV5v95tCVVSo9Xh4TbZNFCadz9hD0asd171LNk3zKB7y5DbY7VYPj35cJ%2F0r90K8Sf6PZ3wTMCqXC0Ol5I5T5m672RdGesv2xg%2FLe79JC5bQItCaXUU%2FgDW3kx8zlDyaQ2vpWRRZc1aZWvTKmqXbwvb3Ru6alfFBqYXq2NWSdbvZLDEf%2BQxGQ3Us6iU%2FiBj8zBGzWIiSuZggSEoIFY8WYhHiEpt3FT%2BiTvERq3wt95z041gzr9mqxmOmySNSWKz1UCvIdhRbFPIffDSumEM6vutzXsobZYGaLy4v1IGQl8fsSJSDArcAB%2F%2BFl98d7neswGE%2FHw9h8F9%2FEewCzrv2wZ7VnP%2FY7nZSUfC3H%2F7YRWydP007r2W2CVNmzdnLc6ImYb7v%2FODeP4RsKrZ4ChM5kkjSiYO8pCRjoVzixmV3BaGUFK4SYbhJe88YPvuR8PwW%2FB9f%2BP%2Bp%2BD8uQpDhLF%2FicWzF%2FJ8srDk4T4mAI9bCOJxrzWxr7uR4jDrBs2HOA8%2FqTXPFiWvLbBGik7NFcmGLptliKVS8AtIYAjl4MOd5lCkijAUSrtwsCeegCeTK%2BOJwPLBMYwLih%2BDthAilLGX710WtClgURDxmJkRDxD9OwQwRHwGdcUZHY3VUy%2FoGmMyb5oGKYpgytloO6JrigFTlgByEOKLtCHvkWkcgWlR3IBBpG8Pgab%2F2%2BYA5M3u%2B2x78Lw%2BrW%2F70OVw9FHd4OA0eYtBso5BjaJ8cqNmo62hbFjr%2BifkpjkYKJpMyM1GZsyVWZ865K3%2FE1LcrodYskx986%2BLKVLxiqTn1aV7hWgQLrrEUp9B4511ePoseMRKgc1kKJIwzPs2qPR%2FDffJjBvwVnGzjCc6txTLibteCwNu%2B2hFndZvjQL%2B2Nv%2BhGUzS6re1f%2F%2BaVRTFn7fbw6pYnG5SbhwU55aAAZZE4om9%2FopXHiW%2BZHjRpuii4Hh0fV29s2%2Fow8fFH%2FbL%2Bl%2FO14%2Fvdt8nyNMogtLS%2BeuN%2FyX5MwgPd8Em2K92y6x0XlzcrM77IHhIlvRP%2F3B4TYznq6dDUFxwts7h6zf%2Bx9S2gSj4zjucOjCtcfWSvCL%2B6zX%2F1yc%2F3LI1iVRWu%2FUePgZP4a1fVS8xJB9W4cav7DDh7XzVKmki9Herw%2FbvohVft8FJ00%2FBls0kpSXiyrzahm6xk3isSbuMUGZhuHrNVXvgFR7L30Rp2Zuum7bwUMF0z37Eg8gIN12YIyTFxdZv%2FlDTROCyH27yiAnQ%2BJF0hOkmlE9x8HGj81gs4RaZ%2FObjqxi6ukx96Y2XU9JbPSUhNMJjkuNq1O8BjAFjVN%2BUDaLYGe50pNffNNtzSv3NnnpuQX2rUd361tLwyLQ0KpOMRySk9qSkEVnlorbkLVHXgDjVDTD1KhsYUuo0F3jGpWv%2BrJpTVOr1nPRcTLiYnEWqAWs1n4lXuOKaJK0sHpFUs8jfxMTyFUWi146GkepC58EhQUMJZo5DauxHJ%2BCQfTM6bxj%2BhT2ZSyAz%2FAvbrvQiUMOOlJGBIdiRxl7COcMi82WhM%2BXe%2B8grkePYEWc1sZUvNZzG10zzyCwZ3zcJLsTPLirPiR9d108wOQPlH6XeNl5uyufFxAgZUM2rVFcupo1BTRutfFQGNUlcR6fv%2BJqq7Dze%2FP6hgVPH%2BVgrelmd9MfM%2FOpcHArLGLFs4vbwye0hQoW6cGKDnLiJwTFVhDyuY%2FCjFuWwJfi05uIKX8HOl8Tx3fAZG5AJP%2BYmztXKAfcsF%2BVN892JByTGOwZLtDi3XzjveDgvU4C5bSvCNz%2F7nZLzqnLgbPgjjdiZnVv%2BHt1%2BcFQ57lAczwkUJV7x7kZ9lAbM2NktKA%2FFcbmjDc37AmlnkZOB82U21MzmGVskrjOerplFXc96S2kqJGJBktoxcM7WUeLpTqIJMkLmhhHKB5xKL9WEK88r9VpKXZOKpuCabeLr%2FPFnXU8XsVUttqDiEjMGsaXzX%2BzmGh5TdiVFZMyZkR1NAi0ZKua2zgkjJt%2BxXyrIXnME0BOb44DG06jjnqacqC%2FxdQ476BFy4h0UL7u4NWjMLNgBw22P9tJOszuJpHp8WO3zp%2B1SPGnF9zHqYOHNpaa74viGVL%2FK9JVm6lf1PIuzaq7j9LBsndSh4kvHCDqFJQpP7FpNxfYMgU5j2awWWCdwuYCKdT6l%2FyZm%2BjNzp1A0n6bx9MYYs84GI61c3pni0d%2FcszXJe1L4%2B%2FWMZ71hT293q8fH7a1V5kpm0JOs1kEsUVBq%2FStyO%2BFqNkKUHemGMXFkbwcHUMnbP%2FYZURwxsr6yU5F82OnJh8MpG6MylLIGYmSlDahb3eJorw8t1euSSBij%2BnYOlP7L9vBNdMJ%2Bf8%2BQw%2F7KGvE%2FDDldNo2MGRekIJaJD9oSLGoRlXTlAYUqHTOhOIjIg0ZONcTUFo5b3QJ4XnULMxjTZSQYh2QRELNPBzHaEGJ4VBCbQIXBu7gjxlwZYtAzAzHl6gsiUI0XpQGtFmITqIZZd2jSc0idFpQ6t7Mxg9IbpeBD40KlN5WxhGFHVE6U0FAsp6zpKwhVof%2FEhlg2tNKRleJY0S1xzwEO%2BlO3ztZlDGPg7EDWNKJnZKIPeyrMOiuYmeNbdrQyFEc0wUoUInCrkaZpgmCNPEOOrGRKTQyBTee91zPYOhzI8ukPHKeA0ClXvk%2Bf%2FoCcp6hzlCC37vqnQuNyVz0hELZOt6C2cGrw56qWl9YtkAsHAGzL6K0jAFsUchDCasiyP2TMZTAuQhjUIbhnsIo1qkWrQNRY4IpkIqMOnrY1c6ZHJllmUqx01pfQVD1PbK9wajSEDl3GkyHQUaMC5hRO24aSPANgBPIMNL0HGBtEXJmqied2hoinhOvKB8G%2BAKJ4FFNSoyGqY2vdwrHpECBsmYJhyANcO9TUgwGMCww6VanrEQuq1GPqiAWVyzy77rykNnFQTROAFTv%2BECZDXcIGY3Awqmed22FHMUTbXe0NirHZNnRjrBlzjZVOOYa0blB30nF6aIGKdwaGkNYyd%2BMJtD9KsaT92XgE2l9Ta8bo5F0tLpsiXA3wknnFsQhP1TZaYj3MaWloALAMcL98jOVPFmUjQImwvdQn0xqXIESuM4WgSN%2BeB6eQdJSGlDJGlv0jsNg3wey5l6tgRFSq5oyaBDlIrFznBqkGbBSZghWNDJndwVTlXDsSiLDjxNTO%2FUPSVRW1cTesYEfqyTNkJVdMhaTGdVBtUJMgT5mK1MAQGi75JcxHOate7Q2i5U6TTcJ4vNjw4c6XSJ5LJE%2FHSJ5LwiS91pBeoCn33U1T1%2FUSAK2XaOAi0U4g0VT5MAqJdna5645hNmNZr0s2u1EyZ3fQ7BR65qzLThHvupTK9Ziod%2B0XoGBEhbDw2WaifjP2ulhHZHThWdYi9LMK8UsZV5i5uTqxNjYv9gyi6M840D%2BXxlamp1FGf%2BKmnw2Vj9z9UYsu70Vxm1L1PKWWmfaLaW8nfYK8TS5puE3y9XJ%2F2zTgFazug11jMF4DjfG60uAyEsuccsfjUYlMGns0MI21YOSTXa4p8qYk9xwYMdQpEyJ2jTu50gAP4GgKBrhMHcY9tJ7iwagoHtApRBLNY3eKcPZPynjRHAFYQoD0HvHJgP5p3lEmVEPzUgM0hPsoGDLmtkjzXm1Qw6BBt1VJiGrxZI8KTpDDKU%2FyWCJFtydsKVmjbGTIvVoRiWX%2BOI0riGmbhdcA0bPGUTIWqpaVbOpMiVN6597V0c2lZAqGIWIM0leVk2mDOi4FpXVKZyk3MQMAqLvLvACgHwAABgA7o%2F%2BObFztllEcGgQArpu%2Bqpy4m9QBoLRO6SzlJoYAAMwDQChYE67qIukkTlCdmqU7iutBBQZVvnQBOudwmlG%2B98gkSi%2FqFpL0Otk5JYnG7P0o4yrHcQSrh6q0QGSAwwwcIFK0a9yB3v%2FMWB6FxoA6gzRdEyWBFYGwc8AbIs4U5tVGySCAHTRFeYOBGUzJF0EerjGJKR93rXHlVKLtWtYfJnxVmH0u%2BmEfOJFpBGI4xTlaxx1dOjU9c%2B9RlEORoahq5cXI1r64XBLJdH10BxCjVh1odqWqA0M4G3GE6gjsfGI1zu6q6C2KRiW%2BHdUkP1Fb1Ak7xgXkm7CePx2sR%2BHYI5CmPFSroNgSNMBVbn14ER0V7DwZddh1pl3tL2lun8w2gcEUSb31BC6i2CBdUDk6tQEcwmoynN28CJQaC0cOKe1yNHeXV5XfLjmz%2BHQq82mXFG9nQTcIUfkiivQdyloGfLcmIwnRzLhdA8etiW6HSrJmd4iklcLKNTJZ1jPQRiZ4FEL3XNpZ8EDZFyL7VlrfUkcOvMOkWqNTGtTmOtFMZohUJ2i4%2B62OGt1J5ZQwUZ%2BbnLLB1JVCvDFypqSjfHK5zUHqj3Ppqfwhn74yJStJ9GrQozRw3JpYWo3UGeIzHElSlTGnIx%2FIwn8OaRg8OZ82JR0TMPAE5QMJK0%2FOs0Xr0owLouzcwAE1Op5m%2BqBnJe%2FDL1c%2F4dtPNx%2FeH377efPt15Auvuq%2BB1aFtiA83AWbYL%2Fa5QFXdNHP6rwPgocEL3%2F6h8Prl%2B0%2FvJPV0yEoIvJHsD8kD5k%2BFv8tYngsAK%2Bv%2BdHhCORqMdMNleh3d7lfbZ7Qy%2ByDu%2F0P3IZgqfMi1NYDeqwenS9SNqd5ZoCjfJkJ1lI1qW5xNFFXbYcmGJUTlhXFcAbFUFRGZT9%2BRFSmjc%2BTI5EIj7qkpKfv4rFJxgPr72OGSmhLU2pXqbPMv0acwIeIVNLyrpY3ixfeVc6TGl%2BM9M%2B8kCyNITJ01aiQcC37wvbRLeoU8wmUPyxGez7WVu36JV7fMhevr4oNNS77Eq9%2Fidcf93pZY4jXLxOqppQdNdk%2FaBrx20scv1bfGcAy0tlRo6N%2BcjK3CvVjDrDoSdUx2ETTMbKntpvzqZAMJOY%2BT6H34CofufIV0aM7gO0cqTSbYtSRavLus73%2FtPWf%2F%2FpGPqzsZ%2FT452zS0o9qPKeKLvcAvRwrtMuocfwY0iQik6Ln2Ka%2BC%2BOIS%2B3cu6rpXGmByACEXZ50si%2BriMszsCRa0FIkcxGZDDUazts2mKh%2BoZ4IlqvTIVAFwTdVIbQ00NI9bTzMrcsnUcwxN43NRFsPD8PcMKammJtsnGGvquZtijWn5prRka9NYc%2B3jFUbeCpe2HNW13PkhZg2PE8Z44W6WDJdetNWe3vJY3vJY9sDDge3d6j4RLQZPjE1hE%2Bnpb1jLMqK%2FG1fmn4csb1%2FvTkVRvPJ7UGvfZQ8mUgym%2FV3PCu%2BCNg1Vgj1owPAvEKiy%2BZ3uY%2BpNtsffx%2BjCnJFN7vcx1zuY0a1Xv%2BX9zFyiO6wtzFajj3mxF%2FndhujZs2meAqlfrrHsmMbTL1cXCswo2mo74X8vdWDVaLPOzXi61XXSLvIxUaGDM%2FDBRK9eagoSTz6ubZUuh3m0lJ5bcsbRyWo4dj27S4s1c3o87qS%2FRkGXNPJqoerh7sPwdrnNf4H%3C%2Fdiagram%3E%3Cdiagram%20id%3D%22FvSOY6w-dSRu-doN5aAw%22%20name%3D%22%E3%83%AF%E3%82%A4%E3%83%95%E3%83%AC%EF%BC%9A%E4%BC%9A%E5%93%A1%E7%99%BB%E9%8C%B2%22%3E1ZfNcpswFIWfRst2kMSPWAImaWbSRetp3S6JUQxTQK6Qg92nr2REbAU5dWZsp1756lxZoO%2BIywXgpF7f8mxZfGY5rQBy8jXAE4AQcgNf%2Fihl0ysQIdIrC17mWtsJ0%2FIP1aKj1VWZ09aYKBirRLk0xTlrGjoXhpZxzjpz2iOrzKsuswUdCdN5Vo3VWZmLolcJCnb6J1ouiuHK0A%2F7TJ0Nk%2FVO2iLLWbcn4RTghDMm%2BqheJ7RS9AYu6A7%2BfnCa%2B4j7szy5ayJG1h%2F6xW7e8pfnLXDaiNMujfqln7JqpXnpvYrNAJCzVZNTtYgDcNwVpaDTZTZX2U6eGakVoq7kCMrwyDvVO3qiXND1nk%2F6zm8pq6ngGzllyDrahOEYYj3udp5C19disWdoOIiZPkiL58V3sGSgeb2BHR6zSzEgGESTbYBA7OggcnUqxq%2Fwhf%2Fm%2B8gaoZ8xdFbexOSNHAtvZMF9NtquhbYHQgeQiQpIqIKrYIuQZ7B1kY0tvCRcbwSX1llZXSdPD747T3%2FEc5m1bcd4fp1Ifcf96L031OAw1PQGxAkgBKQBiGTdjUBKQBRta0OfCq8TfGCtuxfFTiyFNwBhCOIYpLLqJiB%2BrWn4j%2BAGgflSI7Ym4qIvNQgtcF11YMNo%2B3qTzQS04FaKq5Vwoo78SwMkEnnzcSs4%2B0UTVjEu9YY1VPEuq%2BqFdMANdxjrhVVe8S5lfx1V5aKRWl3muUrGmRbm0jbKz9mcQNNH12KjY7HRPYGNX1bu7Kv3E%2Bf3Dz8m31sSieCbbrxNF7dlJ0yOs7OfnB5ycc%2BdYw0dmXHQNtvDafb8Fyt%2BnukrtjVG4WmeTzncfbltc3sfwDj9Cw%3D%3D%3C%2Fdiagram%3E%3Cdiagram%20name%3D%22%E3%83%AF%E3%82%A4%E3%83%95%E3%83%AC%EF%BC%9A%E3%83%AD%E3%82%B0%E3%82%A4%E3%83%B3%E7%94%BB%E9%9D%A2%22%20id%3D%22YTwlvf3Gq9hJ0jkHgJZz%22%3E1Zddk5owFIZ%2FTS7bgQSUXAKitdOPbd2ZdnqXQlYyGwiNUbS%2FvkGCQsHW7agdr0jeEw7J8ybHCFCYbWeSFOl7kVAOoJVsAZoACKEzHulHpexqxYbQq5WlZInRjsKC%2FaRGtIy6ZglddQYqIbhiRVeMRZ7TWHU0IqUou8OeBO9%2BtSBL2hMWMeF99QtLVFqrHhwf9TeULdPmy%2FYI15GMNIPNSlYpSUTZklAEUCiFUHUr24aUV%2FQaLvP4RzH9LL7ZxJ8X88cFQ%2BnDqzrZ9CWvHJYgaa4umxrWqTeErw0vs1a1awBKsc4TWiWxAArKlCm6KEhcRUu9Z7SWqozrnq2bZ87UrGhDpaLblk9m5jMqMqrkTg9popYxodmGyPTLo6e2MzJi2jIUNyIxG2l5SH6EpRuG1wvYoT67yAFBCLAPIhdgBHwbRGOAMQgCEGHghSD4E1%2F773yfRK7MGYNX5e11eUNrgDccwH012m6PNs0I4%2FeBE0K3g9O1h3Dat%2BQ56vEsyGpVCpncJ9KR5bx2%2FzdUb6AkIODpSjDZNyAILNPwHRMK0H0AH4%2B7JcEbKsE3LQn432hXJdkxJRlPgN8vyZqInnuwUlI801BwIbWei5xWuBnnv0knzHCavklcxSvcTF9OfM6WudYyliRVMCBGiLVrVF6zsttdG50BF60BF50LuJjOP9LF88On2dfNO%2Fz2w%2Fdo5%2BHDCtouTvc%2Fo%2BF5dtaDo1Muttw519CeGSdtGzqb3QvTzeqh2%2FUVwQFj8WWOp%2B4er737WOvfA4p%2BAQ%3D%3D%3C%2Fdiagram%3E%3Cdiagram%20name%3D%22%E3%83%AF%E3%82%A4%E3%83%95%E3%83%AC%EF%BC%9A%E5%80%8B%E4%BA%BA%E6%83%85%E5%A0%B1%EF%BC%88%E7%A2%BA%E8%AA%8D%EF%BC%89%22%20id%3D%22Xn7FIMKEVL3gKCDu1J-y%22%3E5VjbbqMwEP0aP3YFmIv9iAlJtWofVtnrIwpuYEtwRElI%2BvU7BjuEQG9S6S5aKVKGM4OBc2bGAwgHm8OiiLbJrYh5hiwjPiA8Q5Zl2Z4LfxI5NohpWaRB1kUaK6wFlukjV6Ch0F0a84dOYClEVqbbLrgSec5XZQeLikJU3bA7kXWvuo3WvAcsV1HWR3%2BkcZk0KLG8Fr%2Fm6TrRVzZd2ng2kQ5WT%2FKQRLGoziAcIhwUQpSNtTkEPJPsaV6%2BJjfkfiGc9Ef1WOzDz9SMjatmsflbTjk9QsHz8n2Xtpql91G2U3ypZy2PmsBC7PKYy0UMhFmVpCVfbqOV9FaQM4Al5SaDIxPMV96peqI9L0p%2BONNJ3fmCiw0viyOEHLrZdMpC75PTIFUrqmm7Kiw5U5RqMFKZtD6t3rIFhiLsDeQ5ffLCOWIBogEK7drwUeggipFvotBFBCPiSMQ3EDN1cNijHEiBm2cPZSHueSAyUQCeixzc7C7NsgvojP87kZeqBi1bH6uFpV8ynkJx%2BFm6zgHbpHEsnSxSwAqE48WISkJL0dIpMbFn9KU0BpS0xxJSN4mOkiAXQYyhEESzEGHPFIb5cmGcCzNmoVjmJb0e7dNr0SF6nbHoxQP0QlkYiMykQag0pkEvvqTXHsxey%2BnzO1ofgkrv84tlt5FtpzagzyhEJ7SvY4B95QqUi9GpiuE4f1%2BM99kVoPeEnhSJQTBBvl%2FXSuOi%2F%2BfOQbozgPuBu4bIF4%2Fb32Ec75eU0ODq189vt2rcGqq6mS4ko1tsYLi66sg0asy8YN0yBmi3Bmh%2FjwIbpH1or35FWU2CbWz%2Ba2wPvCAAtxR4prUxk9t4k9u0dvl23eg8xGyd9iainjJU%2FptynlKDFZXBsJoctWAQCBA7nUXb4avtinBRhljdHkFWMtMrh8pg87ZPTkJ0z3lZdHtoYBtN9KF57SllmTZ8LQR7NkNeofUkVLPtl1U7bVkfotrQFNhXzZVzHrH1XMieUBbXSLOLzXUwnoY0vYIaGNFHK6gvxu38%2B%2F7aXFbGcVfFxL7f3wyOCpD%2Fhvy1m9c0C8HBXbbHfN%2BEw%2FZ7W%2B07%2B2yJwz8%3D%3C%2Fdiagram%3E%3Cdiagram%20name%3D%22%E3%83%AF%E3%82%A4%E3%83%95%E3%83%AC%EF%BC%9A%E5%80%8B%E4%BA%BA%E6%83%85%E5%A0%B1%EF%BC%88%E7%B7%A8%E9%9B%86%EF%BC%89%22%20id%3D%22Q6Jg-45wTD6SKl80gSup%22%3E7Zhdb5swFIZ%2FjS87YcyHfYkJ6apqmrRM27SbigU3oBEcuaRJ%2Butngx0gcdZUatohTarUw2vHCe9jn3MAoHi5vRbpKv%2FEM1YC18m2AE2A67peGMh%2FStm1CnRd3CoLUWRa64RZ8cS06Gh1XWTsYTCx5rysi9VQnPOqYvN6oKVC8M1w2j0vh9%2B6ShfsSJjN0%2FJY%2FV5kdd6q2A07%2FSMrFrn5ZhiQdmSZmsn6Th7yNOObnoQSgGLBed1Gy23MSuWe8eXqF%2BOrG3En%2FLvqh88%2B35KvT1ftYtOXfGR%2FC4JV9esu7bZLP6blWvul77XeGQMFX1cZU4s4ANFNXtRstkrnanQj94zU8npZyisowzN%2Fqb6jRyZqtu1x0r%2F8mvElq8VOTtkOd9N%2BF4Yf%2FFbZdFChF%2BhpeY8oMWKqd9Jiv3rnlgy0YS8xzz92L5kCGgMSg8QH2AGYgsQDNFJ%2FSQAwAthXQ5EDKNSTMQZJCGgIIhkQQCjAgRkiZsHkiIt0Tt4hfagF%2F81iXnIh9YpXcpjeF2V5IPUg3fOq1gfV9cy1XliNKyyFPEFRWSwqqS2LLFODNNXCXNJl4oK48RC3Idhn7VhQe69AGuc%2Fb1fxLdl9v5k9fRNBuna%2F6JN1ArTXBJHCShCI4H%2FQ54OWBcYcZM0ahe8NG1pgBwoelYdZcnXVqT6dJeHzWbLP5ZJZ04WH7mLLUXKJzV3%2FQu5aKo46ODJVTpqcSVQwDnfRobuede%2BaMtG39zVqktVeZLEXqXSk8lITyCSjFbOdIzNHZaF2KNZDlIyVhe%2B%2FOwvvJIuJsdcZIpBBYFjgcTgPD2q161h8dy0Z5mK227qyM2r0KNxG8F9zO7BWSyJ9Jk0wUbm93dukGYq8pmuSjZBntj0EJNSB3v%2Bw6ZzbYkvUZLmaKr%2ByOsSA7j9FuoLctViB6qxo22vBpqy0Kyc6oNOu6RoF9NB%2FHrpnK%2BIXgx5aodvJUhNEBgT96w45g%2FUoqHne89T2DzpvQg2fRS1Q1R97plugJ8iiRmmr2NRMRuNAc3SgLH3b2x4ocqpVILDrxHTzsHfbNHJjyWPHTVqA3r1Jg7Zn%2B5dY33%2B2l2dDvejBIIqawjOqMnOMJ4QXxCMvu3enzVjvFTRK%2FgA%3D%3C%2Fdiagram%3E%3Cdiagram%20name%3D%22%E3%83%AF%E3%82%A4%E3%83%95%E3%83%AC%EF%BC%9A%E6%95%99%E6%9D%90%E4%B8%80%E8%A6%A7%22%20id%3D%22hQ6XgndArOOteEUPDq6l%22%3E7VpZU%2BM4EP41emTLknxIj7ZzbLEsbA3DUMubJzGJBx%2FBMUng169kS%2FGlhDDrJCQFRRGlJXR8X3eru22A3Wg1TL3Z9O9k7IcAaeMVwD2AENItk31wyWshgQiRQjJJg7GQlYLb4M0XQk1IX4KxP68NzJIkzIJZXThK4tgfZTWZl6bJsj7sMQnrq868id8S3I68sC29D8bZtJASZJXyP%2F1gMpUrQ5MWPZEnB4uTzKfeOFlWRLgPsJsmSVa0opXrhxw9icvI%2FXZ33%2F%2Feex6TrDe%2FSKaQJBfFZIOP%2FMv6CKkfZ91OjYqpF174IvASZ81eJYBp8hKPfT6JBrCznAaZfzvzRrx3yXSGyaZZFLJvkDV33Kk40cJPM39V4UnsfOgnkZ%2Blr2zIqq5Nay20%2FjAKybIkFeqmGDatMEql0BOaNFnPXqLFGgKwD4BH2uD1LeBYwCagTwF1ADG3wAnfh%2FMxiTNhUmi%2F8DYANrECXqRAVzf2BC5VgDsAjguoy1GmFDgOR5m4wGFdGBAIqCUbA9A3ATX4MN7oAaqBvg4cAghrEGCbwLbkhP0WSQw2dj5nnqXJk%2B8mYZIyeZzEPuckCMOGaANjuvwuJub9nJOAeSc7DCYxk0XBeMw7HU8IRoxaP90j18ioU40l9VWqNRXVHdjR21%2Bvr87dT%2FPyh%2B%2BtriYmtZf4AkIF1wYgjFw7NyQKbP1EDAnq9HiGpEZX4ePPxk1Rhe4eFl39jHX3%2BOga56u7lnF0z2Cdr%2B5%2BAnTPODwk8NjoysXOUXc%2FAbqqiIxF1hhQWzRY4MwbiMfUhYT0Wl2WkNiy4eDT4AThusJT3L4KET0oJVhNCUO5gTv7JTK1seUYKrvMFkmD5hieWOUS26n%2FFxujS0btymAD2D2eUnH3NgAU5TkX83NGt2Tz7zLzAggPBhr72asSGDUlwESVKSGjrQVdlBzUWqAKN9uZrsH%2Fcns0uRcsMmZGnb2tuvOprK8O%2FLqucxDgn68X8HoytFG0HEbu%2FcOd%2B%2FB0obpuvsoRHXBNGhndAYsR0T%2BDCL5dT65meHm%2FQouX79cPSqILj9eTPlCT7lF6YNssHe9JGBhsoI60HTO9LuxLCbsq4NDlFcYMh%2BEPue1wkI38xtGAA08DbQw%2FG9qqklDbQeW6XdzmjVuk4d%2BE%2FkNAZOTA4vCNXpHKMY7weDxcMXk%2BxENJi9MqQkk2c180eJRSDKanQbplvE%2B6roog90a6KoDcxKwjG7YkwtmqITtwfRKs6fr7rK2vrIOwpg74mqwxCTMNvRKTK5nFuaQa9p9OStYyKOuABrUg8TK6jEff3y51y7NunOHTQvnw1AwzgQngz7RlsmI%2Bv%2FDHxAwc%2FPiYpy0VkTnJP38zjFzbYDueLCzXyiUwLztZXCscW%2B7zZ1ojXm6Jb%2F9innPKhmqQzlaq%2Fa7j39b0Ck%2FfurrLaLeLvVT0flMy1O06uyfIbvcndHOeDeD0uaaUV%2BXmRLy8adtjCOeOkrrebffrDZWsLkGPedz2Udbn1nmhhOnGO3UsyFcpLae9RBuAdeijAOB%2Fs0f53pikLNDkg8USzG8VvkasI8TzmRc3Zb%2Fnkz5SPdq%2BJybubFttgDetvfFm2%2BFllsrNBul6ttaNtetlt3O5w1A8uzCIotqBtQ6qjfePN%2FBXMlj9uibDMP3279XNYKTMgpWmgDZ7kD2Gf9srgd0zRBphofKpvqEqU%2ByLIFUw%2F0VQ5dE1OjJB6vcCvgja9nz2oASpXi34Imj7Q8iOCGJfy9dm877K28e4%2Fx8%3D%3C%2Fdiagram%3E%3Cdiagram%20name%3D%22%E3%83%AF%E3%82%A4%E3%83%95%E3%83%AC%EF%BC%9A%E6%95%99%E6%9D%90%E6%A4%9C%E7%B4%A2%22%20id%3D%2261xSuuuT71N2_gUFXKsp%22%3E5VnbdqM2FP0aPaYLJG56RDaetKudZsVt01cMsqGDkYtJ7MzXVxISGFtxTMf2GmeSB4utgy57nyMdCYBGy%2B2nKl5lv7GUFgBa6RagMYAQOr7HfwTy2iA2hEGDLKo8VVgHTPOvVIGWQp%2FzlK57hjVjRZ2v%2BmDCypImdQ%2BLq4pt%2BmZzVvR7XcULegBMk7g4RJ%2FytM4aNIB%2Bh9%2FTfJHpnm0PNzXLWBurmayzOGWbHQhFAI0qxuqmtNyOaCHY07z8%2BflhOc8iuk7Lh9X95z%2FC31%2Be7prGJkNeaadQ0bI%2Bb9OwafolLp4VX2qu9asmsGLPZUpFIxZAZJPlNZ2u4kTUbrjPcCyrlwV%2FsnnxxJGqGb3QqqbbHZ3UyD9RtqR19cpNtn1var3Q%2F8ltkE0nqu14yizbURRrMFaetGhb79jiBUXYAPKcQ%2FIiH2AMCAERBsEIkGN02u%2FTOWdlrUIKXpZev0%2Bwi6xDeqGBXce9ELmugdwJICOARyDyQOjIgg%2BIA0LJO3EBtkQVjmRVYxwdCMAp4WMn67piX%2BiIFazieMlKKvjOi2IPekMNRz%2BrhkW94DvnK09Y5IuSY8s8TUUliRWQcNlodUEdoduXEdkGGS2TjJeKEWxYYLxCCFDHM04OtGasSgUpvM7791kspsTuir2xt%2FViCm7PKOFjWcVpmpeLnqnTs%2BrcQIOq8ZBX6latxlbTY6hqhnyXsKKIV2va2LRPOx16C%2FXbzHjG%2BDa6D1bGcc3i5MtCrhWiG%2BGQog8AUewn2IHtUPqVc%2Fm3N041hdVWdMQKLpe0xcFsDu0jo82EPyjP7cwKOq8NL4mFz5ELnwsCBIKJboZ7jWjpm9rmMe2KdVUUxjLKZawH43N2wkc%2FlgtHAALetntaJwKsTtX0m%2BRINfKXjCXexO4Y0vft4UB7dNR%2B0MTfcmYaz2GKzuSvBxNwBk7YHWjvnY%2Bg807cHziRYKA9vnXPENvioBnbQ4PNPh5tRo4EaNoiBN5slho3pzQ7qUo%2Fu%2BEcJZb430txuh0DEcazjHkhzzfChCP9xP9aqShE%2FRTGgYcpTGBMYS6Ww%2BgzZC8XRWKbw6Eq8FRTFCAggUL4vrFf5Ssk1AWCbuN4sK8JNpwOIL7m6QC%2BczzYzxdOOTC0GQwWb4XwxzxCBH2pvSseIOjddOQ9%2FfPwdbn154%2FrdPr496%2FqUsMQe%2BFYx5WlCiHUBU8HYXAbAWbvsQ6tE4%2Ff57jbMNJuWvIcGQ6hTIw5%2F7aIHUGyTJVDCxD7NthG9vfGtuEazrCISd%2FG0LSa8SobYF8VlP%2FbICDqrQAbrqbUW1jbELXi8agRnRK5mflCVrWZ8ZYjVSATbYxvQ3TffV90x7SHXUx0ZBTdrCzRhVALYTwWtx5ygtY3oVqb1B1Rrd2yrqKa6dL3UDWO8NBwdJ5H3lAWSaTZxSY3lhQeBJR%2FxYC6%2B%2BX%2B8R65kfWzv31MHsJwQsfGVOGD3Md7tvGDx6Vu5I30mlKCD0Kvb7onvyq5pgzgg5AbnJpe%2FQ9y%2BWP3AVbW7XzHRtF%2F%3C%2Fdiagram%3E%3Cdiagram%20name%3D%22%E3%83%AF%E3%82%A4%E3%83%95%E3%83%AC%EF%BC%9A%E6%95%99%E6%9D%90%E7%99%BB%E9%8C%B2%22%20id%3D%22thtuiyGnDxFvfH9ejdFp%22%3E7VnZUtswFP0aPYaxJC%2FSo%2BU4dAUGSrc3NxaJp07EGEMSvr6SLMVxrRKYYmhmykO4OrqW7XPuIiUAJ4v1cZVdzz%2BKnJcAefka4DFACPlRKP8pZNMgECHSILOqyA3WAhfFPTegZ9DbIuc3HcdaiLIurrvgVCyXfFp3sKyqxKrrdiXK7l2vsxnvARfTrOyjX4q8njcoQVGLv%2BHFbG7vDEPazCwy62ze5Gae5WK1A%2BEU4KQSom6sxTrhpWLP8rIR9fHZ8fm7H6OzaPL9pLjb5MWoWWzylEu2r1DxZf28S6Nm6busvDV8mXetN5bAStwuc64W8QBmq3lR84vrbKpmVzJmJDavF6UcQWk%2B8knNG93xqubrHZ3Mkx9zseB1tZEu6240baMwOgoaZNWKCv3QuM13FKUWzEwkzbart2xJwxD2BPL8PnnpBLAE0ASkIaABoFQbY0A9kEZqyBhIKSAJYFvntEe5JEU%2BPLupK%2FGTJ6IUlcSXYimn2VVRlr9BO%2FxfiWVtchD5dmwWVvOK8UImR1wWs6XEFkWeq0mWGWAqhePVgEqioCslttLuCuk5dPSHkjF0yNhXL1CfZPxAesD96bErz5DpgmwRsyRHfZIphA6Sg4FIjv7nytNlJN1UCV87U4hDRAwIBvFYGwgwzxgxskZofAg5jNyBv7GOPAftyEH7YH2GOmj3dTrEui5J%2FqHKHUVyoJDYAwweBtsY%2Fmts2wfa0w90cFM9Ffu6ikWA%2BTbuIaCRMUwCQECYuYpQV4FrrqLWh5mSJ9NG3ZQBRvQtoGpCZuXUGGxinelhqB4F%2B1X36YuqDp2qu6Vl1oitEuzBEHmE2Achm%2B%2Fvl23btF5GNscBxiGbRGRy%2BKYTMfYHabFGmkY2sc74MLTppZRjyzdYSlV5%2BHa0Xo3kCZlP8f37kJx8HbkySratsSaZABknTbc64H21H7zgvtpJMnZvyZAuSc2%2BK7QhbeM%2Fjm1sJ%2FuaTJMsgapQsrqpQuZrxEx9SZmSMiaAEi1ubLsctm5QVcO2X%2BnLadj2q3aK6lamn4TErq3%2BQYREgF87JB78WqKhnYEkVSpvT1WtsoGOmclhkh8%2B9pwLPXpE4EACBD0BLs8%2FPC%2BhamxPtgDhycSTfy9JtKPzO4kOhuourm9tevusZ%2BU8q6ZmGAxJdYi6jZxSxyYrch37%2FSOP%2FD3bs3k4Ck8%2Fn34Kbk5nl98u%2FPc%2FRyPXmajpJdAaz8z2a0c4GTDC5bD92UDP7fz6gtNf%3C%2Fdiagram%3E%3Cdiagram%20name%3D%22%E3%83%AF%E3%82%A4%E3%83%95%E3%83%AC%EF%BC%9A%E6%95%99%E6%9D%90%E7%99%BB%E9%8C%B2%E3%81%AE%E3%82%B3%E3%83%94%E3%83%BC%22%20id%3D%228sqqKK499zzwHpMY1RKs%22%3E7Vldb5swFP01flyFbT7sR0xI99BJ07qpzyi4CSrBEaVNul8%2F29ghFK9JpZAMaXloro8vBs65H3YDcLLe3dbZZvVN5LwEyMt3AM8AQsiPQvmlkLcWgQiRFlnWRW6wDrgvfnMDegZ9KXL%2B3HNshCibYtMHF6Kq%2BKLpYVldi23f7VGU%2FbtusiUfAPeLrByiD0XerFqUoKjDv%2FJiubJ3hiFtZ9aZdTZv8rzKcrE9gHAKcFIL0bTWepfwUrFneVnDGd285tHd94efT%2FTXbLe5RV%2FaxeafuWT%2FCjWvmvMujdqlX7PyxfBl3rV5swTW4qXKuVrEA5htV0XD7zfZQs1uZcxIbNWsSzmC0jzxSc0bvfK64bsDncyT33Kx5k39Jl12%2FWjaR2F0E7TIthMV%2BqFxWx0oSi2YmUha7lfv2JKGIewT5OEheekcsATQBKQhoAGgVBszQD2QRoBFICYgpYAyQELrnA4ol6TIh2fPTS2eeCJKUUu8EpWcZo9FWb6DDvh%2FFFVjchD5dmwWVvOK8UImR1wWy0pi6yLP1STLDLCQwvF6RCVR0JcSW2kPhfQcOvpjyeg7ZByqF6i%2FZPZBesDj6XEoz5jpgmwRsyRHQ5IphA6Sg5FIDv7nyudlJP1UCa%2BdKaFDRAwIBvFMGwgwzxgxskZofAiZRu7Ad6wjz0E7ctA%2BWp%2BJHLT7Oh1iXZck%2F1DljiI5UEjsAQanwTaG%2Fxrb5KR2oGOb6qnY10VMlizfhj0ENDKGiX8ICDNXEaqc5WqMqfpGEsD2V1Hrw0zFk1mjbsoAI%2FoWUPUgs3JqDDa3znQaokfBcdF9eknRqVN0t7LMGrEVgn0YISdoPQnVfP%2B4avuWdRHVbO04IptEZG74pg8x9hdpsUbaNja3znga2gwyyrHhu2xG2d3l%2B6410ywTIAOlbVYT3lb7wbW31dB1Bm33Xczuu0Ib1DYD4thGd3Ksy7TpEqgaJeubKmW%2BRszUQ8qUlnKjTolWN7ZtDls3qOph17D05TTsGlY3RXUv009CYtdWfxIxEeCrx4TrQLs%2Fa7W8M5CkSub9saqTNtBBM58m%2ByE5kX3o0RsCx1JgeNr99ePuvIyqsT3bAoTnc09%2BLsm0o%2Fs7mQ5G6zCu4%2Bhgs3VW0rN6YYbBmFyHqN%2FNoefaakWuo79%2F45Gx%2BHadQ9uGAq1xZr6vHeTE8c%2FJcwW5HHa%2FHei5g59gcPoH%3C%2Fdiagram%3E%3Cdiagram%20name%3D%22%E3%83%AF%E3%82%A4%E3%83%95%E3%83%AC%EF%BC%9A%E6%95%99%E6%9D%90%E8%A9%B3%E7%B4%B0%22%20id%3D%221j2T8ZzASsdoGpsKqyyY%22%3E7Zpbb9owGIZ%2FjS9bxXYO9mUMYbuZtKna8WaKiAvRQozStEB%2F%2FezEhoR4BSTCoaw3dV47DnyP38%2BHAPBgtvxQxPPpJ5HwDCAnWQI8BAghN%2FDlP6WsagUiRGplUqSJ1jbCQ%2FrKteho9TlN%2BFOrYSlEVqbztjgWec7HZUuLi0Is2s0eRdZ%2B6jye8I7wMI6zrvo9TcpprRIUbPSPPJ1MzZOhT%2BuaWWwa62%2FyNI0TsWhIOAJ4UAhR1qXZcsAzFT0Tl9BZfvl5h75%2BE59ffyxfWPpr9vuu7mx0yC3rr1DwvDxu16ju%2BiXOnnW89HctVyaAhXjOE646cQBmi2la8od5PFa1CzlmpDYtZ5m8grKou%2BNFyZdb8d%2Fx4eE6onIscjHjZbGS9y3bo2k9CoN7r1YWG6jQ9XWzaYMoNWKsR9Jk3fsmWrKgA3ZA8HA3eNEIsAGgAxD5gHqA0qowBNQBEQEhBQyDKADMBcwxjaNOyGXw5IdnT2Uh%2FvCByEQh9Vzkspo9plm2JTXi%2FyjyUnsQueZad6zqFZlUmiPM0kkutVmaJKqSxVoYS0q86JEk8toosUHbBOlYOLp9YfT%2BYzwcI2lT9M8N0bdAxIBgEA6rAqpIVYUQmYKv2xDyRtaDu7NeE1evWXAr6sixhB1Zwt5bCgwsYXcrO4QgksaR8YfKOyrInlJCBzB4HdHG8NKiTSzR7iaoamzTqip0qyRWZSo97CGggS7o8Q8BYfouQlVj2RuTCgVkANj6LmraMJ3xpGvUQxlgpHqE7Gdoeo50gY1MY3od0ANvN3SXnhI6tUK3k2WmEBoQ7M0Rsgfrq6Dmurupraesk1AzuWMHNqlIb7h6HmLsH2hxpdTT2Mg0xtfBpuOo4NyOgrbFgqdWCiojBirEyhxyoUcAJdvmULmt45ujkoiLsb70HF1tlooA4dHIkX89AvO25j0fWcyEbYs7994hfTHbe%2B6rkx4F1G8kxubk1e9q5NS0kDmvWJkVdpcWhbBLCwZ9%2BQvZc59cLzDW08RyZstsQ4AO9O4p6tomOLFtzPc7MNWF78sTPrXSsNuity0qshy27cHiyE45NwviXQQL29mdRBCo4KvJgwHiv6sUBddr4jcmCggt%2BQn2thBDrtURcq9IwooCVYvhd0UB48ujYDsAvS0v%2BJY9yakp2Dclt%2BSFS6BgO9C8LS8Q1zpBnxqEbb93W3a4EBC288f167F6d43Nrs4ozJz%2FhkHj1GSfI5ZLfpd26hGx%2FQLCdhBzrLds8nLzS4aqrvGDEBz9BQ%3D%3D%3C%2Fdiagram%3E%3Cdiagram%20name%3D%22%E3%83%AF%E3%82%A4%E3%83%95%E3%83%AC%EF%BC%9A%E5%AD%A6%E7%BF%92%E6%83%85%E5%A0%B1%EF%BC%88%E7%99%BB%E9%8C%B2%EF%BC%89%22%20id%3D%22tzMKGyWAHafrXepMVT53%22%3E7VpRb5swEP41fuyEjQH7ESdka7t1miKt2l4mFGjCRnBH6ZLs1%2B8MdgLBTTspaZauUaWYz8cR%2FN19x5kidzBfvi3j29kHmaQ5Ik6yRO4QEUJo4MOXQlYNgglhDTIts0RjG2Cc%2FU416Gj0PkvSu45hJWVeZbddcCKLIp1UHSwuS7nomt3IvHvV23ia9oDxJM776HWWVLMGZSTY4O%2FSbDozV8Y%2Bb2bmsTHWd3I3ixO5aEFuhNxBKWXVjObLQZqr1TPr4n2%2BvIg%2FFldXn8jkfPzj7GoVhmeNs9HfnLK%2BhTItqv26Jo3rX3F%2Br9dL32u1MgtYyvsiSZUTB7liMcuqdHwbT9TsAmIGsFk1z%2BEIw1C7S8sqXW6t%2FyM%2FHq9XFGIxlfO0Kldw3rIbTesoDN54DbLYkIqpr81mLUa5AWMdSdO1981qwUAv2F8snttfvGiExADxAYo8FA5R6KMoQGKEOEz5iLmIefWUgwTWxowpG86RECjiiA2QMH4YNw6jHi2wwHCD4q4q5Y90IHNZAl7IAqbFTZbnW1CLoxtZVDpPCTXH2rGaV%2BxlkEBhnk0LwOZZkqhJEWtgAkympT7TXAcRdzRy4HPAKCBeNwxcExbtIHAsMUAPFQLUEgJ7Yv6VcJDpLt%2F%2Bsen2LHS7ilxgXA0IEo4ehMQMfG3D2A5txY9ra5tGfAQy8BYbxLHQQSx0HEyAfQsdtNbLUOUaB16wJftOmgUX%2F2ssBBYWfMQ9pWxqMETcJEUjhiGtKyTIIzVpghEP9EDnC0ZM6LNUGezrZHMWNzaiJapwUYFEra5ANxsaz5EegCw%2FKLMnFQyB93gwUP6cwcCswWBnXJhBaAgSOyPnCTFw0mxS%2Bjib65L4LGzyJ7EJCKQS1WVOiAcYd2ukqZIjY%2ByeNmW9BAyOnYAYWzjjiPu1REIJDIywOuqv0UFRT0GNDOsyycI6Ode8NjZDw2JoyFvTyVrce0pwOdMOAdzoMtTmaKPUyk8zgCJNlAEnLeRFCPR2taZm36EVH9xQ1o6P4GDxYWn51SMSq8k7iI7G5UQfes4xcpR3OeDcIquBrY2gbxx2KBpsmwf9zrFpLrAZkF1p%2BqISxQ9g8Vsf%2FLS0wfto%2FfLLb5UkF%2BTc9y%2Bv32ZfPry%2F%2Fm3bKWtEVD2i9ImDRxQQ2pGx6Tcd%2F2M7v93Pu0FfDQ%2FW0FtZtWUhcOgpGVTlKkTMf9Zi%2BaKS2MPPWO2s%2FNr253ZkbV9uX9P34fT1MT1y%2Btr243pd4kt6lqEmFI%2F1LFNOh%2FFXvBpfCPn9y6ef30JB9Xun3gbQAIX1NlwYKSLamqeRtr6ud2eIeQ51laDqLVTTLjKjndw4VP1F2wZOP%2FGWATg177YMyZbXHFYZ3UtTaWPY1lPultGaB02R3yuBo67Nq8I%2BoLDM6zO%2FL4WFw82763qu9S8AbvQH%3C%2Fdiagram%3E%3Cdiagram%20name%3D%22%E3%83%AF%E3%82%A4%E3%83%95%E3%83%AC%EF%BC%9A%E5%AD%A6%E7%BF%92%E6%83%85%E5%A0%B1%EF%BC%88%E7%99%BB%E9%8C%B2%EF%BC%89%E3%81%AE%E3%82%B3%E3%83%94%E3%83%BC%22%20id%3D%22AepvcP4LhiUk8J58C4Q9%22%3E7VlNc5swEP01OjaDxJd0RDZuD%2B2l6UwyvVGj2DQYpQTHTn99VyBhMIqTzAQnTuPxTMRqWQe9fW%2BlBbmT1fZzmdwsv8lU5Ig46Ra5U0QI8cIA%2FijLfWPBhNDGsiizVNt2hvPsr9BGR1vXWSpue46VlHmV3fSNc1kUYl71bElZyk3f7Urm%2FV%2B9SRZiYDifJ%2FnQepGl1bKxUhLu7F9EtliaX8YBa2ZWiXHWT3K7TFK56ZjcGLmTUsqqGa22E5Gr1TPrch3dxfTyUv7%2Bdfcnv1iIxeWPn5%2BaYLPn3NI%2BQimK6mVDkyb0XZKv9XrpZ63uzQKWcl2kQgVxkMs3y6wS5zfJXM1uIGfAtqxWOVxhGOpwoqzEdm%2F9H%2FnncbuikItCrkRV3sN92342tVkYnvmNZbMDFXuBdlt2EGXGmOhMWrTRd6sFA71gz1g8b7h4sY%2BiKYoCFIeIzxADS4Coi6hfTzmIYxTPEJ8gSmufEEUwYIhxRAMzxQYgwHLC4%2FDbqpTXYiJzWYK9kAVM86ssz%2FdMHUSuZFFpVhLPXOvAal5hlQFdojxbFGBbZWmqJnmiDXPATZT6TvM7iLizmQOfETGnfcwNjF3AHQve3lhw%2Bxa4XQUuIK4GBHFHDyJiBoH2ofQAsfDjxOrCiF8BDLyHBnEscBALHKOxL7DA4Sn6sEhxjQEu2MK%2Bk0bBxW8NhdCCQoAYrD%2BrB1PEDCkaMYw8xCa19HmGJhixUA80XzCiXN8FYgjOEI1zpZN0gnh7FzM%2BvCOqgdJS3qgrxJmayLEegCw%2FKLMnlQyh%2F3gyeOyYyUCtyWBHnJtBZADiBzPnCTlw0mh63uNotiXxKGiyJ6EJFqCSp8sc5w8g7taWpkrOjLN72pANCBgekYCf1%2Bv09%2Fl3cT0tw8L%2FdP%2BVbP7oE0Afslrr1OK%2F0NZUB4w%2F9qgK8r0UaAv0MXap1hTAlhQADIO6SALOoSmtjvo2YPJ6ChIhqnOBRrU8t8xufKaGx5Ghb0to2mG%2Fr0ouozogGHc5BbuzeFerVZxmAHlHlAMjHcu7KNH7%2BzXPtB066cEwHqZHOFZ6WA78SgZojd0ohTQp5%2FrSd15DpFkfAsYsdTW0MdQ7c%2BhIKLgWFIby3BwusRmQQyR9VzQJQlj7zgc%2FjTR4NFG1dXpqCVVb1CFwsEUFmZ0Zn%2BGh878slXsdBDccauFxS6WtoQMY%2BkoFVbGK6n3PEUvluyKxj1%2B71tk6RAdYO5TbD%2Fo%2BTN8Ae69MX1vradAleE9bGc%2Bk4lvayth7PnDejOo2bBQrILqapy1dfW27c8RsQ10lqLqFbtoF1GgnMwHV6aLrA7ef%2BIEBMDUvtgzIlhOlVUZHayrY%2BkCHZbTGQUMUDErgrO%2FzobAPKCz1x%2BslwOXuxXU913n%2F78b%2FAA%3D%3D%3C%2Fdiagram%3E%3C%2Fmxfile%3E
