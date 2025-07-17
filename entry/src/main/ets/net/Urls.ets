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