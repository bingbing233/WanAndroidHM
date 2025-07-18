import { getUrlLogin, getUrlRegister } from '../../net/Urls'
import { http } from '@kit.NetworkKit'

class LoginVm {
  private TAG = "LoginVm"

  login(username: string, password: string) {
    let url = getUrlLogin()
    let req = http.createHttp()
    let param = new LoginParam(username, password)
    req.request(url, {
      method: http.RequestMethod.POST,
      extraData: JSON.stringify(param)
    }, (err, data) => {
      if (!err) {
        // let loginResp = JSON.parse(data.result as string) as string
        console.log(this.TAG, data.result)
      } else {
        console.error(this.TAG, err.message)
      }
    })
  }

  register(username:string,password:string,repassword:string){
    let url = getUrlRegister()
    let req = http.createHttp()
    let param = new RegisterParam(username, password,repassword)
    req.request(url, {
      method: http.RequestMethod.POST,
      extraData: JSON.stringify(param)
    }, (err, data) => {
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
}

class RegisterParam{
  username:string = ""
  password:string = ""
  repassword:string = ""
  constructor(username:string,password:string,repassword:string) {
    this.username = username
    this.password = password
    this.repassword = repassword
  }
}
