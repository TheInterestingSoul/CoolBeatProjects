# CoolBeatProjects

自动抓取通过“备份到云端”功能泄露到公网的玩酷电音工程，整理为 JSON 并利用 [Prettier](https://prettier.io/) 格式化

## Usage

```bash
./grab.sh 1 300000 # grab from ID 1 to 300000
```

## Processing steps

1. 运行 `grab.sh`
2. 清除空目录
3. 清除下列文件名文件
    ```
    AlanWalkerSounds-Demo
    BasicSoundPack-Demo
    EssentialTropicalHouse-Demo
    MarshmelloStyleSounds-Demo
    RockBandSounds-Demo
    WesternClassic-Demo
    烟鬼音色包-演示工程
    MartinGarrixUltimatePack-Demo
    ```
4. 修复 `..mlp` 等极特殊文件名

## Legal Notice

- 《玩酷电音》(CoolBeat) 软件著作权由海宁微视软件有限公司所有
- 各工程著作权由其作者所有，未经原作者允许禁止使用、汇编、修改、公开发布
- **本存储库仅供学习交流**，请于下载、克隆 (`clone`)、复刻 (`fork`)等操作后后的 24 小时内从您的计算机、手机、GitHub 账户中完全删除相关内容
- 如本存储库侵犯了您的权益，请：
  - [联系本人](mailto:wangpy01@outlook.com)
  - [向 GitHub 提交 DMCA 删除请求](https://docs.github.com/en/github/site-policy/dmca-takedown-policy)
