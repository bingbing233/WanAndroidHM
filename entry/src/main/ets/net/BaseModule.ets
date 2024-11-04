export abstract class BaseModule<T> {
  data: T|null = null
  errorCode: number = 200
  errMsg: string = ""
}