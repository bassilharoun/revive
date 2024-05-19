import 'package:revive/data/base/base_repository.dart';
import 'package:revive/data/entities/address_entity.dart';

class AdressRepository extends BaseRepository {
  Future<List<AddressEntity>> getAddresses() async {
    // Get addresses from API
    return List<AddressEntity>.empty();
  }

  Future<AddressEntity> getAddressById(int id) async {
    // Get address by id from API
    return AddressEntity();
  }

  Future<bool> createAddress(AddressEntity address) async {
    var response = super.repository.post("address", "dummy");
    // Create address from API
    return true;
  }

  Future<bool> updateAddress(AddressEntity address) async {
    // Update address from API
    return true;
  }

  Future<bool> deleteAddress(int id) async {
    // Delete address from API
    return true;
  }
}
