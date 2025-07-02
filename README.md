# V2Xverse & OpenCDA Fuzz 测试平台

## 项目简介
本项目集成了自动驾驶协同感知（V2Xverse）与自动驾驶决策仿真（OpenCDA）两大平台，支持端到端的模糊测试（Fuzzing）与安全性评估。平台可自动扰动环境、交通、通信等多维参数，批量生成测试场景，自动检测碰撞、到达、急刹等事件，并输出详细测试报告。

## 目录结构
```
OpenCDA/           # OpenCDA主程序与环境
  └─ src/               # Fuzz测试主流程与各功能模块
      ├─ main.py        # Fuzz主入口
      ├─ Scenario_.py   # 种子场景加载与变异
      ├─ operation.py   # 参数扰动算子
      ├─ opt.py         # 参数设置
      └─ log/           # 每轮结果与报告

V2Xverse/          # V2Xverse主程序与环境
  └─ fuzzing/      # Fuzz测试主流程与各功能模块
      ├─ v2x_fuzz.py   # Fuzz主入口
      ├─ seed.py       # 种子场景加载与变异
      ├─ operator.py   # 参数扰动算子
      ├─ metrics.py    # 仿真与指标
      ├─ report.py     # 结果统计与报告
      └─ results/      # 每轮结果与总报告
carla_0_9_12/      # Carla仿真环境（OpenCDA用）
...
```

## 环境配置
详见 [`测试环境.md`](../测试环境.md) 或各子目录下的 `README.md`。

- OpenCDA: 参考 `v2xfuzz_opencda_environment.yml` 创建conda环境，安装依赖与Carla。
- V2Xverse: 参考 `v2xfuzz_v2xverse_environment.yml` 创建conda环境，安装依赖与数据集。
- 各环境变量加载脚本见 `v2xfuzz_opencda_env.sh`、`v2xfuzz_v2xverse_env.sh`。

## Fuzz测试流程
1. 配置好环境，激活对应conda环境，加载环境变量。
2. 进入 `V2Xverse/fuzzing/` 目录，运行：
   ```shell
   python v2x_fuzz.py
   ```
3. 可在 `results/` 目录下查看每轮结果与自动生成的 `fuzz_report.yaml`。

## 主要功能
- 支持多种参数扰动（天气、交通、RSU等）
- 支持种子场景变异与反馈式fuzz
- 自动检测碰撞、到达、急刹等事件
- 自动统计与生成测试报告
- 结构模块化，便于扩展

## 参考文档
- [OpenCDA官方文档](https://opencda-documentation.readthedocs.io/en/latest/md_files/installation.html)
- [OpenCOOD官方文档](https://opencood.readthedocs.io/en/latest/md_files/installation.html)
- [V2Xverse官方文档](https://github.com/CollaborativePerception/V2Xverse)

## 致谢
感谢各开源社区与贡献者！
