import { http } from "@kit.NetworkKit";

// 请求封装（暂定）
export function req(url:string,method:http.RequestMethod){
  let httpReq = http.createHttp()
  let option:http.HttpRequestOptions = {
    method:method
  }
  httpReq.request(url,option,)
}