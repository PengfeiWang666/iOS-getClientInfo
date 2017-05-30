//
//  BasicViewController.m
//  ClientTest
//
//  Created by Leon on 2017/5/18.
//  Copyright © 2017年 王鹏飞. All rights reserved.
//

#import "BasicViewController.h"
#import "WPFInfo.h"
#import "DeviceInfoManager.h"


@interface BasicViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *infoArray;

@property (nonatomic, strong) UITableView *myTableView;

@end

@implementation BasicViewController

#pragma mark - build
- (instancetype)initWIthType:(BasicInfoType)type {
    self = [super init];
    if (self) {
        if (type == BasicInfoTypeHardWare) {
            [self setupHardwareInfo];
        } else if (type == BasicInfoTypeIpAddress) {
            [self setupAddressInfo];
        } else if (type == BasicInfoTypeDisk){
            [self setupDiskInfo];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myTableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.rowHeight = 80;
    
    [self.view addSubview:self.myTableView];
}

#pragma mark - private Method

- (void)setupHardwareInfo {
    
    self.navigationItem.title = @"Hardware Info";
    
    NSString *deviceName = [[DeviceInfoManager sharedManager] getDeviceName];
    NSLog(@"设备型号-->%@", deviceName);
    NSDictionary *dict1 = @{
                            @"infoKey"   : @"设备型号",
                            @"infoValue" : deviceName
                            };
    [self.infoArray addObject:dict1];
    
    NSString *iPhoneName = [UIDevice currentDevice].name;
    NSLog(@"设备名称-->%@", iPhoneName);
    NSDictionary *dict2 = @{
                            @"infoKey"   : @"iPhone名称",
                            @"infoValue" : iPhoneName
                            };
    [self.infoArray addObject:dict2];
    
    NSString *appVerion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"app版本号-->%@", appVerion);
    NSDictionary *dict3 = @{
                            @"infoKey"   : @"app版本号",
                            @"infoValue" : appVerion
                            };
    [self.infoArray addObject:dict3];
    
    CGFloat batteryLevel = [[UIDevice currentDevice] batteryLevel];
    NSLog(@"电池电量-->%f", batteryLevel);
    NSDictionary *dict4 = @{
                            @"infoKey"   : @"电池电量",
                            @"infoValue" : [@(batteryLevel) stringValue]
                            };
    [self.infoArray addObject:dict4];

    NSString *localizedModel = [UIDevice currentDevice].localizedModel;
    NSLog(@"localizedModel-->%@", localizedModel);
    NSDictionary *dict5 = @{
                            @"infoKey"   : @"localizedModel",
                            @"infoValue" : localizedModel
                            };
    [self.infoArray addObject:dict5];
    
    NSString *systemName = [UIDevice currentDevice].systemName;
    NSLog(@"当前系统名称-->%@", systemName);
    NSDictionary *dict6 = @{
                            @"infoKey"   : @"当前系统名称",
                            @"infoValue" : systemName
                            };
    [self.infoArray addObject:dict6];
    
    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    NSLog(@"当前系统版本号-->%@", systemVersion);
    NSDictionary *dict7 = @{
                            @"infoKey"   : @"当前系统版本号",
                            @"infoValue" : systemVersion
                            };
    [self.infoArray addObject:dict7];
    
    NSString *device_model = [[DeviceInfoManager sharedManager] getDeviceModel];
    NSLog(@"device_model-->%@", device_model);
    NSDictionary *dict8 = @{
                             @"infoKey"   : @"device_model",
                             @"infoValue" : device_model
                             };
    [self.infoArray addObject:dict8];
    
    BOOL canMakePhoneCall = [DeviceInfoManager sharedManager].canMakePhoneCall;
    NSLog(@"能否打电话-->%d", canMakePhoneCall);
    NSDictionary *dict9 = @{
                             @"infoKey"   : @"能否打电话",
                             @"infoValue" : @(canMakePhoneCall)
                             };
    [self.infoArray addObject:dict9];
}

- (void)setupAddressInfo {
    
    self.navigationItem.title = @"IP && Address";
    
    // 广告位标识符：在同一个设备上的所有App都会取到相同的值，是苹果专门给各广告提供商用来追踪用户而设的，用户可以在 设置|隐私|广告追踪里重置此id的值，或限制此id的使用，故此id有可能会取不到值，但好在Apple默认是允许追踪的，而且一般用户都不知道有这么个设置，所以基本上用来监测推广效果，是戳戳有余了
    NSString *idfa = [[DeviceInfoManager sharedManager] getIDFA];
    NSLog(@"广告位标识符idfa-->%@", idfa);
    NSDictionary *dict1 = @{
                            @"infoKey"   : @"广告位标识符idfa",
                            @"infoValue" : idfa
                            };
    [self.infoArray addObject:dict1];
    
    //  UUID是Universally Unique Identifier的缩写，中文意思是通用唯一识别码。它是让分布式系统中的所有元素，都能有唯一的辨识资讯，而不需要透过中央控制端来做辨识资讯的指 定。这样，每个人都可以建立不与其它人冲突的 UUID。在此情况下，就不需考虑数据库建立时的名称重复问题。苹果公司建议使用UUID为应用生成唯一标识字符串。
    NSString *uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSLog(@"唯一识别码uuid-->%@", uuid);
    NSDictionary *dict2 = @{
                            @"infoKey"   : @"唯一识别码uuid",
                            @"infoValue" : uuid
                            };
    [self.infoArray addObject:dict2];
    
    NSString *device_token_crc32 = [[NSUserDefaults standardUserDefaults] objectForKey:@"device_token_crc32"];
    NSLog(@"device_token_crc32真机测试才会显示-->%@", device_token_crc32);
    if (device_token_crc32 == nil) {
        device_token_crc32 = @"";
    }
    NSDictionary *dict3 = @{
                             @"infoKey"   : @"device_token_crc32真机测试才会显示",
                             @"infoValue" : device_token_crc32
                             };
    [self.infoArray addObject:dict3];
    

    
    
    NSString *macAddress = [[DeviceInfoManager sharedManager] getMacAddress];
    NSLog(@"macAddress-->%@", macAddress);
    NSDictionary *dict4 = @{
                             @"infoKey"   : @"macAddress",
                             @"infoValue" : macAddress
                             };
    [self.infoArray addObject:dict4];
    
    NSString *deviceIP = [[DeviceInfoManager sharedManager] getDeviceIPAddresses];
    NSLog(@"deviceIP-->%@", deviceIP);
    NSDictionary *dict5 = @{
                             @"infoKey"   : @"deviceIP",
                             @"infoValue" : deviceIP
                             };
    [self.infoArray addObject:dict5];
    
    NSString *cellIP = [[DeviceInfoManager sharedManager] getIpAddressCell];
    NSLog(@"cellIP-->%@", cellIP);
    NSDictionary *dict6 = @{
                             @"infoKey"   : @"蜂窝地址",
                             @"infoValue" : cellIP
                             };
    [self.infoArray addObject:dict6];
    
    NSString *wifiIP = [[DeviceInfoManager sharedManager] getIpAddressWIFI];
    NSLog(@"cellIP-->%@", wifiIP);
    NSDictionary *dict7 = @{
                             @"infoKey"   : @"WIFI IP地址",
                             @"infoValue" : wifiIP
                             };
    [self.infoArray addObject:dict7];
    
}

- (void)setupDiskInfo {
    self.navigationItem.title = @"Disk && Memory";
    
    NSUInteger cpuCount = [[DeviceInfoManager sharedManager] getCPUCount];
    NSLog(@"cpuCount-->%ld", cpuCount);
    NSDictionary *dict1 = @{
                            @"infoKey"   : @"CPU总数目",
                            @"infoValue" : @(cpuCount)
                            };
    [self.infoArray addObject:dict1];
    
    CGFloat cpuUsage = [[DeviceInfoManager sharedManager] getCPUUsage];
    NSLog(@"cpuUsage-->%f", cpuUsage);
    NSDictionary *dict2 = @{
                            @"infoKey"   : @"CPU使用的总比例",
                            @"infoValue" : @(cpuUsage)
                            };
    [self.infoArray addObject:dict2];
    
    NSArray *perCPUArr = [[DeviceInfoManager sharedManager] getPerCPUUsage];
    NSMutableString *perCPUUsage = [NSMutableString string];
    for (NSNumber *per in perCPUArr) {
        
        [perCPUUsage appendFormat:@"%.2f<-->", per.floatValue];
    }
    NSLog(@"单个CPU使用比例-->%@", perCPUUsage);
    NSDictionary *dict3 = @{
                            @"infoKey"   : @"单个CPU使用比例",
                            @"infoValue" : perCPUUsage
                            };
    [self.infoArray addObject:dict3];
}


#pragma mark - UITableViewDelegate && UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.infoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 为cell设置标识符
    static NSString *idetifier = @"kIndentifier";
    
    //从缓存池中取出 对应标示符的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idetifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:idetifier];
    }
    
    // 获取数据字典
    NSDictionary *infoDict = self.infoArray[indexPath.row];
    
    WPFInfo *infoModel = [WPFInfo infoWithDict:infoDict];
    
    cell.textLabel.text = infoModel.infoKey;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"------>%@", infoModel.infoValue];
    cell.detailTextLabel.numberOfLines = 0;
    
    return cell;
}

#pragma mark - setters && getters
- (NSMutableArray *)infoArray {
    if (!_infoArray) {
        _infoArray = [NSMutableArray array];
    }
    return _infoArray;
}


@end
