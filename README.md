# JustRun
### 简单的变速跑计时器，功能点
* 支持设置慢跑和快跑速度，单位km/h（不填写则默认6.5和8.5）
* 支持设置四个循环时间，单位s（不填写默认四个时间都是10）
* 点击「设置好了」到跑步计时页面
* 页面显示当前跑步速度，当前速度需要持续的时间
* 下一个速度，下一个速度需要持续的时间
* 点击「开始」后一秒开始倒计时
* 倒计时到最后一秒，会提示应该把速度切换到多少
* 执行的循环是：速度1 + 时间1 -> 速度2 + 时间2 -> 速度1 + 时间3 -> 速度2 + 时间4
* 点击「结束跑步」回到设置页面，停止计时


### 使用举例
* 慢速设置6.5，快跑8.5，时间分别是30，30，60，60，意思就是30秒慢跑，30秒快跑，60秒慢跑，60秒快跑，然后循环
* 慢速设置6.5，快跑8.5，时间分别是60，30，60，63，意思就是60秒慢跑，30秒快跑，然后循环

### 开发驱动
本人跑步使用的是举例中第一种，循环比较复杂，跑着跑着就忘了应该在什么时候切速度
