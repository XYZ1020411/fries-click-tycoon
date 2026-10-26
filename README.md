# 🍟 薯條點擊大亨

手機與桌機皆可玩的 HTML5 薯條點擊經營遊戲，使用 Supabase 帳號登入、雲端存檔及多人房間。

## 功能
- 點擊薯條賺錢、升級設備、購買店鋪與被動收入
- 5 分鐘遊戲計時器
- 必須使用電子郵件與密碼登入／註冊
- Supabase 雲端存檔，登入後可跨裝置繼續
- 建立或加入多人房間，使用房間代碼與其他玩家同步分數
- 行動裝置響應式介面

## 本機執行
直接以瀏覽器開啟根目錄的 `index.html`。雲端登入、存檔與多人房間需要網路連線。

## Supabase
專用專案：`pmdbdckspefacykvfvbq`（Tokyo，Free plan）。
- `fries_game_saves`：個人雲端存檔
- `fries_multiplayer_rooms`：多人房間
- `fries_multiplayer_players`：房間玩家與分數
- `fries_scores`：分數資料
- 已啟用 RLS，並將多人房間與玩家表加入 Realtime publication。
- Supabase Auth 的 Email provider 必須啟用，使用者才能註冊／登入。
- 前端只能使用公開 publishable/anon key，絕不可放入 service-role 或其他秘密金鑰。

## Cloudflare Pages
此專案以根目錄的靜態 `index.html` 發佈，無需建置指令；Cloudflare Pages 設定的輸出目錄為根目錄 `/`。

## Repository
https://github.com/XYZ1020411/fries-click-tycoon
