import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

class FutureBuilderRoute extends StatefulWidget {
  @override
  _FutureBuilderRouteState createState() => _FutureBuilderRouteState();
}

Dio dio = Dio();

class _FutureBuilderRouteState extends State<FutureBuilderRoute> {
  Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FutureBuilder(
          future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //请求完成
            if (snapshot.connectionState == ConnectionState.done) {
              Response response = snapshot.data;
              //发生错误
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              //请求成功，通过项目信息构建用于显示项目名称的ListView
              return ListView(
                children: response.data
                    .map<Widget>((e) => ListTile(title: Text(e["full_name"])))
                    .toList(),
              );
            }
            //请求未完成时弹出loading
            return CircularProgressIndicator();
          }),
    );
  }

  TestGet() async {
    Dio _dio = Dio();
    Response response;
    response = await _dio.get("/test?id=12&name=jian");
    //封装query参数
    response =
        await _dio.get("/test", queryParameters: {"id": 12, "name": "jian"});
    //发起post请求
    response = await _dio.post("/test", data: {"id": 12, "name": "jian"});
    //发起多个并发请求
    response = (await Future.wait([_dio.post("/info"), _dio.get("/path")]))
        as Response;
    //下载文件
    response = await _dio.download("https://www.google.com/", "savePath");
    //发送FormData
    FormData formData2 = FormData.fromMap({"name": "jian", "age": 12});
    response = await _dio.post("/info", data: formData2);
    print(response.data.toString());

    FormData formData = FormData.fromMap({
      "name": "wendux",
      "age": 25,
      // "file1": UploadFileInfo(File("./upload.txt"), "upload1.txt"),
      // "file2": UploadFileInfo(File("./upload.txt"), "upload2.txt"),
      // 支持文件数组上传
      "files": [
        // UploadFileInfo(File("./example/upload.txt"), "upload.txt"),
        // UploadFileInfo(File("./example/upload.txt"), "upload.txt")
      ]
    });
    response = await _dio.post("/info", data: formData);

    //一个JSON格式的用户列表字符串
    String jsonStr ='[{"name":"Jack"},{"name","Rose"}]';
    //将JSON字符串转为Dart对象(此处是List)
    List items = json.decode(jsonStr);
    print(items[0].name);

    // Map<String,dynamic> user = json.decoder(json);
    // print('Howdy, ${user['name']}!');
    // print('We sent the verification link to ${user['email']}.');
  }

//分块下载
// download() async {
//   // 通过第一个分块请求检测服务器是否支持分块传输
//   Response response = await downloadChunk(url, 0, firstChunkSize, 0);
//   if (response.statusCode == 206) { //如果支持
//     //解析文件总长度，进而算出剩余长度
//     total = int.parse(
//         response.headers
//             .value(HttpHeaders.contentRangeHeader)
//             .split("/")
//             .last);
//     int reserved = total -
//         int.parse(response.headers.value(HttpHeaders.contentLengthHeader));
//     //文件的总块数(包括第一块)
//     int chunk = (reserved / firstChunkSize).ceil() + 1;
//     if (chunk > 1) {
//       int chunkSize = firstChunkSize;
//       if (chunk > maxChunk + 1) {
//         chunk = maxChunk + 1;
//         chunkSize = (reserved / maxChunk).ceil();
//       }
//       var futures = <Future>[];
//       for (int i = 0; i < maxChunk; ++i) {
//         int start = firstChunkSize + i * chunkSize;
//         //分块下载剩余文件
//         futures.add(downloadChunk(url, start, start + chunkSize, i + 1));
//       }
//       //等待所有分块全部下载完成
//       await Future.wait(futures);
//     }
//     //合并文件文件
//     await mergeTempFiles(chunk);
//   }
// }

//start 代表当前块的起始位置，end代表结束位置
//no 代表当前是第几块
//   Future<Response> downloadChunk(url, start, end, no) async {
//     progress.add(0); //progress记录每一块已接收数据的长度
//     --end;
//     return dio.download(
//       url,
//       savePath + "temp$no", //临时文件按照块的序号命名，方便最后合并
//       onReceiveProgress: createCallback(no), // 创建进度回调，后面实现
//       options: Options(
//         headers: {"range": "bytes=$start-$end"}, //指定请求的内容区间
//       ),
//     );
//   }
}
