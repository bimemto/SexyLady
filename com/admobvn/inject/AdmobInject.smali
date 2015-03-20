.class public Lcom/admobvn/inject/AdmobInject;
.super Landroid/app/Activity;
.source "AdmobInject.java"


# static fields
.field public static TYPE_MOBILE:I

.field public static TYPE_NOT_CONNECTED:I

.field public static TYPE_WIFI:I


# instance fields
.field private className:Ljava/lang/String;

.field private interstitial:Lcom/google/android/gms/ads/InterstitialAd;

.field private isAdDisplayed:Z

.field private mCountDownTimer:Landroid/os/CountDownTimer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const/4 v0, 0x1

    sput v0, Lcom/admobvn/inject/AdmobInject;->TYPE_WIFI:I

    .line 21
    const/4 v0, 0x2

    sput v0, Lcom/admobvn/inject/AdmobInject;->TYPE_MOBILE:I

    .line 22
    const/4 v0, 0x0

    sput v0, Lcom/admobvn/inject/AdmobInject;->TYPE_NOT_CONNECTED:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 16
    const-string v0, "clazzName"

    iput-object v0, p0, Lcom/admobvn/inject/AdmobInject;->className:Ljava/lang/String;

    .line 19
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/admobvn/inject/AdmobInject;->isAdDisplayed:Z

    .line 14
    return-void
.end method

.method static synthetic access$0(Lcom/admobvn/inject/AdmobInject;)V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/admobvn/inject/AdmobInject;->displayAd()V

    return-void
.end method

.method private displayAd()V
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/admobvn/inject/AdmobInject;->interstitial:Lcom/google/android/gms/ads/InterstitialAd;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/admobvn/inject/AdmobInject;->interstitial:Lcom/google/android/gms/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/InterstitialAd;->isLoaded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 55
    iget-object v0, p0, Lcom/admobvn/inject/AdmobInject;->interstitial:Lcom/google/android/gms/ads/InterstitialAd;

    invoke-virtual {v0}, Lcom/google/android/gms/ads/InterstitialAd;->show()V

    .line 56
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/admobvn/inject/AdmobInject;->isAdDisplayed:Z

    .line 60
    :goto_0
    return-void

    .line 58
    :cond_0
    invoke-direct {p0}, Lcom/admobvn/inject/AdmobInject;->startGame()V

    goto :goto_0
.end method

.method public static getConnectivityStatus(Landroid/content/Context;)I
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 107
    const-string v2, "connectivity"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 108
    .local v1, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 109
    .local v0, "activeNetwork":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_1

    .line 110
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 111
    sget v2, Lcom/admobvn/inject/AdmobInject;->TYPE_WIFI:I

    .line 116
    :goto_0
    return v2

    .line 113
    :cond_0
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    if-nez v2, :cond_1

    .line 114
    sget v2, Lcom/admobvn/inject/AdmobInject;->TYPE_MOBILE:I

    goto :goto_0

    .line 116
    :cond_1
    sget v2, Lcom/admobvn/inject/AdmobInject;->TYPE_NOT_CONNECTED:I

    goto :goto_0
.end method

.method private initAd()V
    .locals 3

    .prologue
    .line 63
    new-instance v1, Lcom/google/android/gms/ads/InterstitialAd;

    invoke-direct {v1, p0}, Lcom/google/android/gms/ads/InterstitialAd;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/admobvn/inject/AdmobInject;->interstitial:Lcom/google/android/gms/ads/InterstitialAd;

    .line 64
    iget-object v1, p0, Lcom/admobvn/inject/AdmobInject;->interstitial:Lcom/google/android/gms/ads/InterstitialAd;

    const-string v2, "ca-app-pub-4088717889688649/6821957211"

    invoke-virtual {v1, v2}, Lcom/google/android/gms/ads/InterstitialAd;->setAdUnitId(Ljava/lang/String;)V

    .line 65
    new-instance v1, Lcom/google/android/gms/ads/AdRequest$Builder;

    invoke-direct {v1}, Lcom/google/android/gms/ads/AdRequest$Builder;-><init>()V

    invoke-virtual {v1}, Lcom/google/android/gms/ads/AdRequest$Builder;->build()Lcom/google/android/gms/ads/AdRequest;

    move-result-object v0

    .line 66
    .local v0, "adRequest":Lcom/google/android/gms/ads/AdRequest;
    iget-object v1, p0, Lcom/admobvn/inject/AdmobInject;->interstitial:Lcom/google/android/gms/ads/InterstitialAd;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/ads/InterstitialAd;->loadAd(Lcom/google/android/gms/ads/AdRequest;)V

    .line 67
    return-void
.end method

.method private initTimer()V
    .locals 6

    .prologue
    .line 72
    new-instance v0, Lcom/admobvn/inject/AdmobInject$1;

    const-wide/16 v2, 0xfa0

    const-wide/16 v4, 0x3e8

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/admobvn/inject/AdmobInject$1;-><init>(Lcom/admobvn/inject/AdmobInject;JJ)V

    iput-object v0, p0, Lcom/admobvn/inject/AdmobInject;->mCountDownTimer:Landroid/os/CountDownTimer;

    .line 83
    iget-object v0, p0, Lcom/admobvn/inject/AdmobInject;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    .line 84
    return-void
.end method

.method public static isNetworkAvailable(Landroid/content/Context;)Z
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 120
    invoke-static {p0}, Lcom/admobvn/inject/AdmobInject;->getConnectivityStatus(Landroid/content/Context;)I

    move-result v0

    .line 121
    .local v0, "status":I
    sget v1, Lcom/admobvn/inject/AdmobInject;->TYPE_NOT_CONNECTED:I

    if-eq v0, v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private startGame()V
    .locals 3

    .prologue
    .line 87
    invoke-static {p0}, Lcom/admobvn/inject/AdmobInject;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 88
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 89
    .local v1, "intent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/admobvn/inject/AdmobInject;->className:Ljava/lang/String;

    invoke-virtual {v1, p0, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 90
    invoke-virtual {p0, v1}, Lcom/admobvn/inject/AdmobInject;->startActivity(Landroid/content/Intent;)V

    .line 91
    invoke-virtual {p0}, Lcom/admobvn/inject/AdmobInject;->finish()V

    .line 104
    .end local v1    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 94
    :cond_0
    iget-boolean v2, p0, Lcom/admobvn/inject/AdmobInject;->isAdDisplayed:Z

    if-nez v2, :cond_1

    .line 95
    new-instance v2, Lcom/google/android/gms/ads/AdRequest$Builder;

    invoke-direct {v2}, Lcom/google/android/gms/ads/AdRequest$Builder;-><init>()V

    invoke-virtual {v2}, Lcom/google/android/gms/ads/AdRequest$Builder;->build()Lcom/google/android/gms/ads/AdRequest;

    move-result-object v0

    .line 96
    .local v0, "adRequest":Lcom/google/android/gms/ads/AdRequest;
    iget-object v2, p0, Lcom/admobvn/inject/AdmobInject;->interstitial:Lcom/google/android/gms/ads/InterstitialAd;

    invoke-virtual {v2, v0}, Lcom/google/android/gms/ads/InterstitialAd;->loadAd(Lcom/google/android/gms/ads/AdRequest;)V

    .line 97
    iget-object v2, p0, Lcom/admobvn/inject/AdmobInject;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v2}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    goto :goto_0

    .line 99
    .end local v0    # "adRequest":Lcom/google/android/gms/ads/AdRequest;
    :cond_1
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 100
    .restart local v1    # "intent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/admobvn/inject/AdmobInject;->className:Ljava/lang/String;

    invoke-virtual {v1, p0, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 101
    invoke-virtual {p0, v1}, Lcom/admobvn/inject/AdmobInject;->startActivity(Landroid/content/Intent;)V

    .line 102
    invoke-virtual {p0}, Lcom/admobvn/inject/AdmobInject;->finish()V

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 27
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 28
    invoke-direct {p0}, Lcom/admobvn/inject/AdmobInject;->initTimer()V

    .line 29
    invoke-direct {p0}, Lcom/admobvn/inject/AdmobInject;->initAd()V

    .line 30
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/admobvn/inject/AdmobInject;->mCountDownTimer:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_0

    .line 47
    iget-object v0, p0, Lcom/admobvn/inject/AdmobInject;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 49
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 50
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 36
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 37
    iget-object v0, p0, Lcom/admobvn/inject/AdmobInject;->mCountDownTimer:Landroid/os/CountDownTimer;

    if-nez v0, :cond_0

    .line 38
    invoke-direct {p0}, Lcom/admobvn/inject/AdmobInject;->initTimer()V

    .line 40
    :cond_0
    invoke-direct {p0}, Lcom/admobvn/inject/AdmobInject;->startGame()V

    .line 41
    return-void
.end method
