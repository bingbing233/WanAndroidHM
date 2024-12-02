const baseUrl = "https://www.wanandroid.com"

export const urlHomeBanner = baseUrl + "/banner/json"

const urlHomeArticles = baseUrl + "/article/list/0/json"

export function getUrlHomeArticles(curPage: number = 0): string {
  return baseUrl + "/article/list/" + curPage + "/json"
}