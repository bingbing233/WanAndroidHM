import { BaseModule } from '../BaseModule';

export class HomeBanner extends BaseModule<HomeBanner[]> {
  desc: string = ""
  id: number = 0
  imagePath: string = ""
  isVisible: number = 0
  order: number = 0
  title: string = ""
  type: number = 0
  url: string = ""
}