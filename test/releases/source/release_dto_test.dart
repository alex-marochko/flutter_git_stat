import 'dart:convert';

import 'package:git_stat/releases/source/release_dto.dart';
import 'package:git_stat/releases/source/released_repository_dto.dart';
import 'package:test/test.dart';

void main() {
  test('ReleasedRepositoryDto & ReleaseDto test', () {
    const jsonString = r'''
      {
          "data": {
            "search": {
              "repositoryCount": 127,
              "edges": [
                {
                  "node": {
                    "id": "R_kgDOIoAhgw",
                    "name": "localsend",
                    "description": "An open source cross-platform alternative to AirDrop",
                    "url": "https://github.com/localsend/localsend",
                    "stargazers": {
                      "totalCount": 10978
                    },
                    "releases": {
                      "edges": [
                        {
                          "node": {
                            "name": "v1.3.1",
                            "createdAt": "2023-01-04T20:35:42Z",
                            "description": "- fix: local IP sometimes not found"
                          }
                        }
                      ]
                    }
                  }
                },
                {
                  "node": {
                    "id": "R_kgDOH5v2Kw",
                    "name": "flutter-wonderous-app",
                    "description": "A showcase app for the Flutter SDK. Wonderous will educate and entertain as you uncover information about some of the most famous structures in the world.",
                    "url": "https://github.com/gskinnerTeam/flutter-wonderous-app",
                    "stargazers": {
                      "totalCount": 3010
                    },
                    "releases": {
                      "edges": []
                    }
                  }
                },
                {
                  "node": {
                    "id": "R_kgDOHs0GaA",
                    "name": "keyviz",
                    "description": "Keyviz is a free and open-source tool to visualize your keystrokes ⌨️ in real-time.",
                    "url": "https://github.com/mulaRahul/keyviz",
                    "stargazers": {
                      "totalCount": 2138
                    },
                    "releases": {
                      "edges": [
                        {
                          "node": {
                            "name": "v0.1.0b 🎉 First Release",
                            "createdAt": "2022-07-22T13:06:27Z",
                            "description": "Let your audience know 😏 what handy shortcuts/keys you're pressing during **screencasts**, **presentations**, **collaborations**, or whenever you need it. Download your copy of **Keyviz** and start to visualize your keystrokes in real time.\r\n\r\n## Features\r\n- Filter hotkeys and only display shortcuts ✂️.\r\n- Shift symbols, i.e. display <kbd>#</kbd> when <kbd>Shift</kbd> + <kbd>3</kbd> is pressed.\r\n- Show/hide previously pressed keys.\r\n- Customize 🎨 the visualization's style, size, color (modifiers and others), border, icon, and symbol.\r\n- Adjust the visualization position on the screen 💻.\r\n- Set the duration ⌛ for which the visualization lingers on the screen before animating out.\r\n- Choose from catchy animation presets 🦄 to animate your visualization in and out.\r\n\r\n_❗ Please be advised this is a beta release! Do contact/open an issue if you find any bug 🐛._"
                          }
                        }
                      ]
                    }
                  }
                },
                {
                  "node": {
                    "id": "R_kgDOHzR_-A",
                    "name": "Obtainium",
                    "description": "Get Android App Updates Directly From the Source.",
                    "url": "https://github.com/ImranR98/Obtainium",
                    "stargazers": {
                      "totalCount": 1462
                    },
                    "releases": {
                      "edges": [
                        {
                          "node": {
                            "name": "v0.1.0-beta",
                            "createdAt": "2022-08-24T01:51:04Z",
                            "description": "Core functionality should work without showstopping errors.\r\nSmaller bugs and instability can be expected, especially when it comes to background processes (checking for updates, downloading apps and sending notifications when ready, etc.)."
                          }
                        }
                      ]
                    }
                  }
                },
                {
                  "node": {
                    "id": "R_kgDOHRGz1w",
                    "name": "dart_frog",
                    "description": "A fast, minimalistic backend framework for Dart 🎯",
                    "url": "https://github.com/VeryGoodOpenSource/dart_frog",
                    "stargazers": {
                      "totalCount": 1366
                    },
                    "releases": {
                      "edges": [
                        {
                          "node": {
                            "name": "dart_frog-v0.0.1-dev.1",
                            "createdAt": "2022-05-24T17:01:40Z",
                            "description": "- feat: initial experimental release 🎉"
                          }
                        }
                      ]
                    }
                  }
                },
                {
                  "node": {
                    "id": "R_kgDOI5xiRQ",
                    "name": "bili_you",
                    "description": "一个用flutter制作的第三方B站客户端.",
                    "url": "https://github.com/lucinhu/bili_you",
                    "stargazers": {
                      "totalCount": 1265
                    },
                    "releases": {
                      "edges": [
                        {
                          "node": {
                            "name": "v1.0.1",
                            "createdAt": "2023-02-04T18:06:38Z",
                            "description": "初始上传"
                          }
                        }
                      ]
                    }
                  }
                },
                {
                  "node": {
                    "id": "R_kgDOIE0gng",
                    "name": "flutter_smooth",
                    "description": "Achieve ~60 FPS, no matter how heavy the tree is to build/layout",
                    "url": "https://github.com/fzyzcjy/flutter_smooth",
                    "stargazers": {
                      "totalCount": 1203
                    },
                    "releases": {
                      "edges": []
                    }
                  }
                },
                {
                  "node": {
                    "id": "R_kgDOHmo-aw",
                    "name": "flutter-tips-and-tricks",
                    "description": "My Flutter Tips & Tricks on Twitter 👇",
                    "url": "https://github.com/bizz84/flutter-tips-and-tricks",
                    "stargazers": {
                      "totalCount": 1081
                    },
                    "releases": {
                      "edges": []
                    }
                  }
                },
                {
                  "node": {
                    "id": "R_kgDOJC68mQ",
                    "name": "dart_simple_live",
                    "description": "简简单单的看直播",
                    "url": "https://github.com/xiaoyaocz/dart_simple_live",
                    "stargazers": {
                      "totalCount": 764
                    },
                    "releases": {
                      "edges": [
                        {
                          "node": {
                            "name": "1.0.0-test",
                            "createdAt": "2023-02-27T09:00:03Z",
                            "description": "测试版本"
                          }
                        }
                      ]
                    }
                  }
                },
                {
                  "node": {
                    "id": "R_kgDOHsqsMg",
                    "name": "saber",
                    "description": "A (work-in-progress) cross-platform libre handwritten notes app",
                    "url": "https://github.com/adil192/saber",
                    "stargazers": {
                      "totalCount": 607
                    },
                    "releases": {
                      "edges": [
                        {
                          "node": {
                            "name": "v0.0.1",
                            "createdAt": "2022-07-26T23:21:43Z",
                            "description": "# Snapshot of Discussion #1 \r\n\r\n## This discussion post will track implemented features.\r\n\r\n### Short-term:\r\n- [x] General UI\r\n- [x] Material You dynamic theming; dark mode\r\n- [x] Basic writing on canvas\r\n- [x] Undo/redo\r\n- [X] Zooming\r\n- [ ] Erasing writing on canvas\r\n- [ ] Changing writing colour\r\n- [ ] Saving on local storage\r\n\r\n### Long-term:\r\n- [ ] Highlighter\r\n- [ ] Select/move tool\r\n- [ ] Shape tool\r\n- [ ] Canvas backgrounds\r\n- [ ] Add images\r\n- [ ] Cloud sync\r\n- [ ] Self-hosted cloud sync"
                          }
                        }
                      ]
                    }
                  }
                }
              ]
            }
          }
        }    
    ''';

    final jsonData = jsonDecode(jsonString);
    List<dynamic> repositoryEdges = jsonData['data']['search']['edges'];
    List<ReleasedRepositoryDto> releasedRepositoriesDtos = repositoryEdges
        .map((rawRepo) => ReleasedRepositoryDto.fromJson(rawRepo))
        .toList();

    expect(releasedRepositoriesDtos.length, equals(10));
    final lastRepo = ReleasedRepositoryDto(
      id: 'R_kgDOHsqsMg',
      name: 'saber',
      description:
          'A (work-in-progress) cross-platform libre handwritten notes app',
      url: 'https://github.com/adil192/saber',
      stargazersCount: 607,
      releases: [
        ReleaseDto(
            name: 'v0.0.1',
            createdAt: DateTime.parse('2022-07-26T23:21:43Z'),
            description:
                '''# Snapshot of Discussion #1 \r\n\r\n## This discussion post will track implemented features.\r\n\r\n### Short-term:\r\n- [x] General UI\r\n- [x] Material You dynamic theming; dark mode\r\n- [x] Basic writing on canvas\r\n- [x] Undo/redo\r\n- [X] Zooming\r\n- [ ] Erasing writing on canvas\r\n- [ ] Changing writing colour\r\n- [ ] Saving on local storage\r\n\r\n### Long-term:\r\n- [ ] Highlighter\r\n- [ ] Select/move tool\r\n- [ ] Shape tool\r\n- [ ] Canvas backgrounds\r\n- [ ] Add images\r\n- [ ] Cloud sync\r\n- [ ] Self-hosted cloud sync''')
      ],
    );
    expect(releasedRepositoriesDtos.last, equals(lastRepo));
  });
}
