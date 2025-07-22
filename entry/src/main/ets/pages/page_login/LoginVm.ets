import { getUrlLogin, getUrlRegister } from '../../net/Urls'
import { http } from '@kit.NetworkKit'

interface GeneratedObjectLiteralInterface_1 {
  "Content-Type": string;
}

interface GeneratedObjectLiteralInterface_2 {
  'Content-Type': string;
}

export class LoginVm {
  private TAG = "LoginVm"

  login(username: string, password: string) {
    let url = getUrlLogin()
    let req = http.createHttp()
    let param = new LoginParam(username, password)
    req.on("headersReceive",(data:object)=>{
      console.log(this.TAG,JSON.stringify(data))
    })
    req.request(url, {
      method: http.RequestMethod.POST,
      extraData: param.body(),
    }, (err, data) => {
      if (!err) {
        // let loginResp = JSON.parse(data.result as string) as string
        console.log(this.TAG, data.result)
      } else {
        console.error(this.TAG, err.message)
      }
    })
  }

  register(username: string, password: string, repassword: string) {
    let url = getUrlRegister()
    let req = http.createHttp()
    let param = new RegisterParam(username, password, repassword)
    req.request(url, {
      method: http.RequestMethod.POST,
      extraData: param.body()
    }, (err, data) => {
      console.log(this.TAG, `param = ${JSON.stringify(param)}`)
      if (!err) {
        // let loginResp = JSON.parse(data.result as string) as string
        console.log(this.TAG, data.result)
      } else {
        console.error(this.TAG, err.message)
      }
    })
  }
}

class LoginParam {
  username: string = ""
  password: string = ""

  constructor(username: string, password: string) {
    this.username = username
    this.password = password
  }

  body(): string {
    return `username=${this.username}&password=${this.password}`
  }
}

class RegisterParam {
  username: string = ""
  password: string = ""
  repassword: string = ""

  constructor(username: string, password: string, repassword: string) {
    this.username = username
    this.password = password
    this.repassword = repassword
  }

  body():string{
    return `username=${this.username}&password=${this.password}&repassword=${this.repassword}`
  }
}
