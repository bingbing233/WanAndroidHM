const baseUrl = "https://www.wanandroid.com"

// 首页banner
export const urlHomeBanner = baseUrl + "/banner/json"

// 首页文章
export function getUrlHomeArticles(curPage: number = 0): string {
  return baseUrl + "/article/list/" + curPage + "/json"
}

// 项目
export const urlProjectClass = baseUrl + "/project/tree/json"

export function getUrlProjects(curPage: number = 0, cid: number = 0) {
  return baseUrl + "/project/list/" + curPage + "/json?cid=" + cid
}

// 登录
export function getUrlLogin(): string {
  return baseUrl + "/user/login"
}

// 注册
export function getUrlRegister(): string {
  return baseUrl + "/user/register"
}

// 退出登录
export function getUrlLogout(): string {
  return baseUrl + "/user/logout/json"
}