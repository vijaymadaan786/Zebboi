const hostUrl = "134.209.22.215";
const baseUrl = "https://zebboi.extensionerp.com";
const productUrl = '/api/resource/Item?fields=["*"]&limit_page_length=None';
const categoryPath =
    '/api/resource/Item Group?fields=["*"]&limit=None&order_by=name desc';
const binPath = '/api/resource/Bin?fields=["*"]&limit=None';
const loginPath = "/api/method/zebboi.custom.login.login";
const checkLoginPath = "/api/method/zebboi.custom.login.check_logged_in";
const salesOrderPath =
    '/api/resource/Sales Order?fields=["*"]&order_by=creation desc';
const dealerPath = '/api/resource/User/?fields=["name","phone","full_name"]';
const tagPath = '/api/resource/Tag';
