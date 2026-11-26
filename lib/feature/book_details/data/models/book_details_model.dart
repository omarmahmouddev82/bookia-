
class BookDetailsModel {
    BookDetails? data;
    String? message;
    int? status;

    BookDetailsModel({this.data, this.message, this.status});

    BookDetailsModel.fromJson(Map<String, dynamic> json) {
        data = json["data"] == null ? null : BookDetails.fromJson(json["data"]);
        message = json["message"];
        status = json["status"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        _data["message"] = message;
        _data["status"] = status;
        return _data;
    }
}

class BookDetails {
    int? id;
    String? name;
    String? description;
    int? stock;
    int? bestSeller;
    String? price;
    int? discount;
    double? priceAfterDiscount;
    String? image;
    String? category;

    BookDetails({this.id, this.name, this.description, this.stock, this.bestSeller, this.price, this.discount, this.priceAfterDiscount, this.image, this.category});

    BookDetails.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        name = json["name"];
        description = json["description"];
        stock = json["stock"];
        bestSeller = json["best_seller"];
        price = json["price"];
        discount = json["discount"];
        priceAfterDiscount = json["price_after_discount"];
        image = json["image"];
        category = json["category"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["name"] = name;
        _data["description"] = description;
        _data["stock"] = stock;
        _data["best_seller"] = bestSeller;
        _data["price"] = price;
        _data["discount"] = discount;
        _data["price_after_discount"] = priceAfterDiscount;
        _data["image"] = image;
        _data["category"] = category;
        return _data;
    }
}