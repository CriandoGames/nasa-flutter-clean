import 'dart:convert';

import 'package:space_clean/core/errors/execeptions.dart';
import 'package:space_clean/core/http_client/http_client.dart';
import 'package:space_clean/core/util/converters/date_to_string_convert.dart';
import 'package:space_clean/core/util/keys/nasa_api_keys.dart';
import 'package:space_clean/feature/data/datasources/endpoints/nasa_endpoints.dart';
import 'package:space_clean/feature/data/datasources/space_media_datasource.dart';
import 'package:space_clean/feature/data/models/space_media_model.dart';

class NasaDatasourceImplementation implements ISpaceMediaDatasource {
  final HttpClient client;

  NasaDatasourceImplementation(this.client);

  @override
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date) async {
    final response = await client.get(NasaEndpoints.apod(
        NasaApiKeys.apiKey, DateToStringConvert.convert(date)));

    if (response.statusCode == 200) {
      return SpaceMediaModel.fromJson(json.decode(response.data));
    } else {
      throw ServerException();
    }
  }
}
