import 'dart:convert';
import 'package:api_handler/api_handler.dart';
import 'package:api_handler/feature/api_handler/data/enums/header_enum.dart';
import 'package:api_handler/feature/api_handler/data/enums/response_enum.dart';
import 'package:api_handler/feature/api_handler/data/models/query_model.dart';
import 'package:api_handler/feature/api_handler/data/models/response_model.dart';
import 'package:api_handler/feature/api_handler/presentation/presentation_usecase.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  APIHandler api = APIHandler();

  @override
  void initState() {
    super.initState();
    api.onTokenExpired(() {
      print('TOKEN EXPIRED!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                MaterialButton(
                  onPressed: () async {
                    api.setToken(
                        "eyJhbGciOiJBMTI4S1ciLCJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwidHlwIjoiSldUIn0.lJwZwM0BENmsWWoigXJaR_rFPsNqA3dhAuf-Zhkv-aB4QG5EOl4c5Q.7DP00lZ8lh5QbGDWGSqnvA.Vxfo-wbd5uiRah7UqrwX3fkQ5yN-xr2Brt8Lvm70-gZW44aEhFubXXV8-C1txaJZslvGlzCT8qfn5jUMXASJV1CRs8l2HY3yMaP6tlbQ9XTgvC8pxmOaes-emMT-EeG9NYwmD4nIE7cNobtAQ_N8VDPFvQsS-rwy7R26HJCNqBqZO01MokKdqTJQV4Gin-SRqyOjwtT2Ml93rDRA9lUUvi0XnU5nhw-7lyh1CIIGYvkVCV8YePuijJ3zXQq6AeTTm2gRo1brtkKxozC0O-f3I9SA9ll_j2-yixTT5-khQvROzdyyLOfHMTz-bwfYfIiia-M03VW4UEIhSO50Z4bIpuRBqWmNIRUCQG8SO5aV9wnpSAhnWJ5uMcJFH2WYMZpoTrud0ItrYOYsQoQSQSstU-dHlPOKcYna-ZB-Rqf7BUwvdmLXXtxEc1AOuK3D2YaLlV2PczH1qN1W8lZ7L47GBPwmpW5z4XccntYhp66qW4L5IuaLYdyb0SxZgL46NvcC4V_Ho6pep0iTMarQonHds-bfBvUrhByv_wbqnRqr_hvDfHNat-aeYyp45nwhYNQDriBdIBEE56kJJAb7uNb9JgCt0_sejEnHMpZfMYjccC3FJ4UVTJ21I1LVMmgP2Md0eM5_0YslZO8vpIxnHERuNGXm0dvksRCx7-ZyJ7mjG6AZO8_ZHm9tyvYNXL8_0aIA7v2Z2etU7oCnaUFcuKvenuE27DVQMpbnKBwXFfoRxtTNgpxQxyubylFtsbBZwWEu0u6bvuaaVA_j7TYZ8VPriTAHHxJe4W5a6Aib26qpw1X9yHbIU8u3UU-S0PoRtaO3HV9pOK0V3NjHOYxMxSES_Hy1Bd-Y99HcVjGDyiw0cy3jf3LJ_osinfrJA7Ma13T7AdaXlY2fszI2sDRBg7hDKSnsINiDAg7iiOfc2Opm4luHFFh6d0zySoAvSPO1Lw-p.f0y9VQfuLHRakStQrihaNw");
                    ResponseModel res = await api.get(
                      "https://appgaraj.dinavision.org/api/v1/Business/GetBusinessByToken",
                      queries: [
                        QueryModel(name: "mobile", value: "09199118259")
                      ],
                      headerEnum: HeaderEnum.bearerHeaderEnum,
                      responseEnum: ResponseEnum.responseModelEnum,
                    );

                    if (res.result == ResultEnum.success) {
                      print(res);
                    }
                  },
                  color: Colors.red,
                  child: Text("Get"),
                ),
                MaterialButton(
                  onPressed: () async {
                    APIHandler api = APIHandler();
                    api.setToken(
                        "eyJhbGciOiJBMTI4S1ciLCJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwidHlwIjoiSldUIn0.vOT_IkEywsJmUljw9yLfn-UQRN8BiAyXrNq82npLjsxl6270IGeNcQ.pp2zvjCTBdXi9JHFmIQ_MQ.HE7cmO2h6u6SXLgsIJd3axIXeWX6eufHQfDhV2ygkH4hbZC3Pp5eLxHIXvwd8-Bed74OExl-9PeJmsyTyEmIBq8dyxSIh483BHva0t76wTUZmdN_1PUm-Dce-mnILsK8gV5EENlTQ6IeqpUim8Brme0z2H39pCPPF-KxyjmzV7-G-qg1MXwAYQa-VCKwkDDBmwUVxwtsdgyl3jJQFxY4ki3NXpf4cn76TsjcGJlygkhmh1wEUHRL7lUSuBBa02_8D0fC31Lrc_8iZk69CDRFLtvDwa0Tw-V7mVuhb5TK1RMkNHxfbNGDHea2HIs03g0bgpHlGYGi66ftLo0MnhfMVCGYm0U7FQI-CiEwJB-TR0w58sJPHj5vBNrhNSEm-h_-oJyBOeP7jezyNFVRswND-7BGzrBB88iyLXm0jYa7-VyHE7RZEYhtL3UFAL9zk_jr0pKKkrE7_bW_klrt4esTm5_MxGDORm1hVV_X1Doqf2X4PKLncdU-GS91aCKbVVrhenQWw44GE_AMvWd_qdshbyPDTUaoVG0wAN6bZPjAhfj3K0mJMpfFPK_MqkB8JUnBt3u7v5mN86vzeSrVhfPI1Mn-e3pGbF1l09kxdi9-vqdsMEVZmffsCx5MWlV6cOUpQjrR2VghrmnGyz6Qc8p3wqIsX3Y0H2rENk49wVhqfFbzwYZ_vgpMPkPVnY-BooNNAUNVgkF0TLy-DpLjyygpztpYAjj8Ku7cKgnTdoA7DD7utMpdXLOh3gwYaqhnT3AAKYQkQYhssdTmlNzghLOqij19d-OmWqviSu7CaP5pks5rdMwFqk_Pc3QIz4WmIpTOzh6fxKOZope_r6YINeWCEGxhjLFxNiS2FKxgJxJZTWNnD_dVTxM7DtsSumc_x2ZEm94OvjNhYvW84dXwQcJNbWfCVxxU6pm0iYiCbBXDfxpzDOiGp5Y2Mn-EY7ddcFjD.1XtH66jnhm5mtFul_W44xQ");
                    Map<String, dynamic> body = {
                      "locationX": 52,
                      "locationY": 34,
                      "nearest": true,
                      "businessTypeId": 1,
                      "isOnMoving": false,
                      // "vehicleTypeId": FilterService.selectedVehicleTypeId
                    };

                    ResponseModel res = await api.post(
                      'https://google.com',
                      body: jsonEncode(body),
                      // queries: [
                      //   QueryModel(name: "mobile", value: "09199118259")
                      // ],
                      headerEnum: HeaderEnum.bearerHeaderEnum,
                      responseEnum: ResponseEnum.responseModelEnum,
                    );

                    if (res.result == ResultEnum.success) {
                      print(res);
                    }
                  },
                  color: Colors.blue,
                  child: const Text("Post"),
                ),
                MaterialButton(
                  onPressed: () {},
                  color: Colors.green,
                  child: const Text("Put"),
                ),
              ],
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
