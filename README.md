# 1000 Kelime 

[![N|Nodejs](https://raw.githubusercontent.com/berkekurnaz/1000Kelime/master/examples/images/logo.png)]()


Dünya Dillerinde En Sık Kullanılan 1000 Kelimenin Bulunduğu Mobil Uygulama.

  - Dünya dillerinden en sık kullanılan 1000 kelime ve örnek cümleler içerir.
  - Dart programlama dilinde Flutter ile geliştirilmiştir.
  - Uygulama içerisinde kelime verileri 'assets/data' klasörü altında bulunur.

### Kullanılan Paketler

Bu uygulamada aşağıdaki üçüncü parti paketler kullanılmıştır:

* [sqflite] - Uygulama içerisinde kullanıcının kaydettiği kelimeleri saklamak için veritabanı.
* [flip_card] - Flutter için geliştirilmiş dönen kart componenti.
* [getflutter] - Flutter için component kütüphanesi.
* [rflutter_alert] - Modern mesaj kutusunu kullanıcıya göstermek için.
* [flutter_overboard] - Açılış sayfası için geliştirilmiş özel component.
* [shared_preferences] - Uygulama içerisinde küçük verileri saklamak için.

Bu liste sürekli güncellenmektedir.


### Kurulum

Bu uygulamayı kendi ortamınızda kurmak ve çalıştırmak isterseniz aşağıdaki adımları gerçekleştirin.

```sh
$ git clone https://github.com/berkekurnaz/1000Kelime.git
$ flutter doctor
$ flutter run
```

### Destekçi Olun
Uygulama içerisinde keşfettiğiniz hataları, yanlış olduğunu farkettiğiniz kelime veya anlamlarını lütfen bizimle paylaşın. <br/>
Ayrıca yeni kelimeleri bize aşağıdaki format ile gönderirseniz uygulamanın yeni sürümünde sizin kelimelerinizde dahil edilecektir.
```sh
1-Kelime-Anlamı-ÖrnekCümle-ÖrnekCümleAnlamı
2-Kelime-Anlamı-ÖrnekCümle-ÖrnekCümleAnlamı
3-Kelime-Anlamı-ÖrnekCümle-ÖrnekCümleAnlamı
```

### Nasıl Çalışır ?
Uygulama içerisinde 'assets/data' klasörü altında saklanan json dosyaları parçalanarak bir liste halinde kullanıcıya gösterilir. Kullanıcı bu kelimeleri kaydetmek istediği zaman sqlite veritabanına başvurulur.

## Uygulama Görüntüleri
[![N|Nodejs](https://raw.githubusercontent.com/berkekurnaz/1000Kelime/master/examples/images/image1.png)]()
[![N|Nodejs](https://raw.githubusercontent.com/berkekurnaz/1000Kelime/master/examples/images/image2.png)]()

### Uygulamaya Eklenecekler
 - İngilizce 250 Kelime, İspanyolca 50 Kelime, Almanca 1000 Kelime ve Fransızca 1000 Kelime Eklenecek.
 - Kelimeler için Google Api ile sesli telaffuz özelliği eklenecek.
 - Admob reklamlar eklenecek.

## Geliştirici Ve İletişim
```sh
Geliştirici: Berke Kurnaz
```
```sh
Mail Adresi: contact@berkekurnaz.com
```