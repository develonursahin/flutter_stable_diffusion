# Flutter Stable Diffusion App

Bu proje, Flutter kullanılarak geliştirilmiş bir mobil uygulamadır. Stable Diffusion adlı bir lokal sunucu üzerinde çalışan bir modeli kullanarak metin veya resmi işleyip sonuç elde etmeyi amaçlamaktadır.

## Proje Yapısı

Proje, BLoC (Business Logic Component) mimarisi ve state management yöntemini kullanarak kodlanmıştır. BLoC, uygulamanın veri akışını yöneten ve UI (User Interface) ile iş mantığı arasındaki bağlantıyı sağlayan bir tasarım desenidir.

...

## Stable Diffusion API Kullanımı

Bu uygulama, Stable Diffusion adlı bir lokal sunucu üzerinde çalışan bir modeli kullanır. API ile etkileşim kurmak için şu adımları takip edebilirsiniz:

1. **IP Adresini Almak:**
   - Komut istemcisine gidin ve `ipconfig` komutunu kullanarak IP adresinizi bulun.
   - Örneğin:
     ```bash
     ipconfig
     ```
   - IPv4 Address bölümünde bilgisayarınızın IP adresini bulabilirsiniz.

2. **IP Adresini AppStatics Sınıfına Eklemek:**
   - `app/constants/app_statics.dart` dosyasını açın.
   - `AppStatics` sınıfındaki `baseUrl` sabitini, bulduğunuz IP adresi ve API'nin port numarası ile güncelleyin:
     ```dart
     class AppStatics {
       static String baseUrl = "http://<IP_ADRESINIZ>:7860/sdapi/v1/";
     }
     ```
   - `<IP_ADRESINIZ>` kısmını, önceki adımda bulduğunuz IP adresi ile değiştirmeniz gerekiyor.

3. **ServicePath'leri Kullanarak Endpoint Oluşturmak:**
   - `app/core/enum/service_path.dart` dosyasını açın.
   - `ServicePath` enum'unu ve `ServicePathExtension` extension sınıfını kullanarak farklı endpointlere istekler atabilirsiniz.

4. **İstekleri Gerçekleştirmek:**
   - `app/core/sd_service.dart` dosyasındaki `SDService` sınıfını kullanarak istekleri gerçekleştirebilirsiniz.

## Proje Yapısı

Proje, aşağıdaki ana başlıklar altında düzenlenmiştir:

- **`lib` Klasörü**: Ana uygulama klasörü.
  - **`app` Klasörü**: Uygulamanın genel yapısını içerir.
  - **`core` Klasörü**: Uygulamanın temel bileşenlerini içerir.
    - **`base` Klasörü**: Genel model ve servis sınıflarını içerir.
      - `base_request_model.dart`: Temel istek modellerini içerir.
      - `base_response_model.dart`: Temel yanıt modellerini içerir.
    - **`service` Klasörü**: Temel önbellek ve servis sınıflarını içerir.
      - `base_cache_service.dart`: Temel önbellek servisini içerir.
      - `base_service.dart`: Temel servis sınıfını içerir.
  - ...

## Kullanılan Paketler

- **`dio`**: HTTP istekleri yönetmek için kullanılır.
- **`flutter_bloc`**: BLoC mimarisi için kullanılır.
- **`image_gallery_saver`**: Resimleri galeriye kaydetmek için kullanılır.
- **`image_picker`**: Kullanıcının galerisinden resim seçmesini sağlar.

## Nasıl Çalıştırılır

1. Projeyi bilgisayarınıza klonlayın.
2. Proje klasörüne gidin ve terminalde `flutter pub get` komutunu çalıştırın.
3. Ardından, `flutter run` komutu ile uygulamayı başlatın.

## Stable Diffusion API İle İletişim

Uygulama, Stable Diffusion ile iletişim kurmak için `SDService` adlı bir servis sınıfını kullanmaktadır. Bu sınıf, HTTP isteklerini yönetir ve projede kullanılan modellerin oluşturulması için gerekli fonksiyonları sağlar.

## Ekranlar

### Model Seçim Ekranı (ModelSelectView)

Model seçim ekranı, uygulamanın başlangıcında karşımıza çıkar. Kullanıcı, bu ekranda mevcut modeller arasından bir seçim yapabilir.

...

### Prompt Ekranı (PromptView)

Prompt ekranı, seçilen model üzerinde metin veya resim işleme adımlarını içerir. Kullanıcı, bu ekran üzerinden metin girişi yapabilir ve resim boyutlarını ayarlayabilir.

...

## Lisans

Bu proje [MIT Lisansı](LICENSE) ile lisanslanmıştır.
...

