
import 'package:space_clean/feature/data/models/space_media_model.dart';

abstract class ISpaceMediaDatasource {
 Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date);
  
}