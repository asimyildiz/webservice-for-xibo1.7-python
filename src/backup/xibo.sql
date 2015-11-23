-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Anamakine: localhost
-- Üretim Zamanı: 23 Kas 2015, 18:26:43
-- Sunucu sürümü: 5.6.21-log
-- PHP Sürümü: 5.6.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Veritabanı: `xibo`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `auditlog`
--

CREATE TABLE IF NOT EXISTS `auditlog` (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `logDate` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(254) NOT NULL,
  `entity` varchar(50) NOT NULL,
  `entityId` int(11) NOT NULL,
  `objectAfter` text NOT NULL,
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bandwidth`
--

CREATE TABLE IF NOT EXISTS `bandwidth` (
  `DisplayID` int(11) NOT NULL,
  `Type` tinyint(4) NOT NULL,
  `Month` int(11) NOT NULL,
  `Size` bigint(20) NOT NULL,
  PRIMARY KEY (`DisplayID`,`Type`,`Month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bandwidthtype`
--

CREATE TABLE IF NOT EXISTS `bandwidthtype` (
  `bandwidthtypeid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`bandwidthtypeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Tablo döküm verisi `bandwidthtype`
--

INSERT INTO `bandwidthtype` (`bandwidthtypeid`, `name`) VALUES
(1, 'Register'),
(2, 'Required Files'),
(3, 'Schedule'),
(4, 'Get File'),
(5, 'Get Resource'),
(6, 'Media Inventory'),
(7, 'Notify Status'),
(8, 'Submit Stats'),
(9, 'Submit Log'),
(10, 'Blacklist'),
(11, 'Screen Shot');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `blacklist`
--

CREATE TABLE IF NOT EXISTS `blacklist` (
  `BlackListID` int(11) NOT NULL AUTO_INCREMENT,
  `MediaID` int(11) NOT NULL,
  `DisplayID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL COMMENT 'Null if it came from a display',
  `ReportingDisplayID` int(11) DEFAULT NULL COMMENT 'The display that reported the blacklist',
  `Reason` text NOT NULL,
  `isIgnored` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Ignore this blacklist',
  PRIMARY KEY (`BlackListID`),
  KEY `MediaID` (`MediaID`),
  KEY `DisplayID` (`DisplayID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Blacklisted media will not get sent to the Display' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `campaign`
--

CREATE TABLE IF NOT EXISTS `campaign` (
  `CampaignID` int(11) NOT NULL AUTO_INCREMENT,
  `Campaign` varchar(254) NOT NULL,
  `IsLayoutSpecific` tinyint(4) NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`CampaignID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Tablo döküm verisi `campaign`
--

INSERT INTO `campaign` (`CampaignID`, `Campaign`, `IsLayoutSpecific`, `UserID`) VALUES
(2, 'Default Layout', 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dataset`
--

CREATE TABLE IF NOT EXISTS `dataset` (
  `DataSetID` int(11) NOT NULL AUTO_INCREMENT,
  `DataSet` varchar(50) NOT NULL,
  `Description` varchar(254) DEFAULT NULL,
  `UserID` int(11) NOT NULL,
  `LastDataEdit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`DataSetID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `datasetcolumn`
--

CREATE TABLE IF NOT EXISTS `datasetcolumn` (
  `DataSetColumnID` int(11) NOT NULL AUTO_INCREMENT,
  `DataSetID` int(11) NOT NULL,
  `Heading` varchar(50) NOT NULL,
  `DataTypeID` smallint(6) NOT NULL,
  `DataSetColumnTypeID` smallint(6) NOT NULL,
  `ListContent` varchar(255) DEFAULT NULL,
  `ColumnOrder` smallint(6) NOT NULL,
  `Formula` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`DataSetColumnID`),
  KEY `DataSetID` (`DataSetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `datasetcolumntype`
--

CREATE TABLE IF NOT EXISTS `datasetcolumntype` (
  `DataSetColumnTypeID` smallint(6) NOT NULL,
  `DataSetColumnType` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `datasetcolumntype`
--

INSERT INTO `datasetcolumntype` (`DataSetColumnTypeID`, `DataSetColumnType`) VALUES
(1, 'Value'),
(2, 'Formula');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `datasetdata`
--

CREATE TABLE IF NOT EXISTS `datasetdata` (
  `DataSetDataID` int(11) NOT NULL AUTO_INCREMENT,
  `DataSetColumnID` int(11) NOT NULL,
  `RowNumber` int(11) NOT NULL,
  `Value` varchar(255) NOT NULL,
  PRIMARY KEY (`DataSetDataID`),
  KEY `DataColumnID` (`DataSetColumnID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `datatype`
--

CREATE TABLE IF NOT EXISTS `datatype` (
  `DataTypeID` smallint(6) NOT NULL,
  `DataType` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `datatype`
--

INSERT INTO `datatype` (`DataTypeID`, `DataType`) VALUES
(1, 'String'),
(2, 'Number'),
(3, 'Date'),
(4, 'Image');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `device`
--

CREATE TABLE IF NOT EXISTS `device` (
  `device_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `device_securecode` varchar(255) NOT NULL,
  `device_clientid` int(11) NOT NULL,
  `device_name` varchar(255) NOT NULL,
  `device_detail` text,
  `device_cpuid` varchar(50) NOT NULL,
  `device_lastaccess` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `device_ip` varchar(15) NOT NULL,
  `device_localip` varchar(15) NOT NULL,
  `device_activationdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `device_deactivationdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `deviceaccess`
--

CREATE TABLE IF NOT EXISTS `deviceaccess` (
  `deviceaccess_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `device_id` bigint(20) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `deviceaccess_layoutdownloaded` char(1) NOT NULL DEFAULT '0',
  `deviceaccess_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deviceaccess_hdd` varchar(50) NOT NULL,
  `deviceaccess_freehdd` varchar(50) NOT NULL,
  `deviceaccess_memory` varchar(50) NOT NULL,
  `deviceaccess_freememory` varchar(50) NOT NULL,
  `deviceaccess_lastsound` int(11) NOT NULL,
  `deviceaccess_version` varchar(10) NOT NULL,
  PRIMARY KEY (`deviceaccess_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `display`
--

CREATE TABLE IF NOT EXISTS `display` (
  `displayid` int(11) NOT NULL AUTO_INCREMENT,
  `isAuditing` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Is this display auditing',
  `display` varchar(50) NOT NULL,
  `defaultlayoutid` int(8) NOT NULL,
  `license` varchar(40) DEFAULT NULL,
  `licensed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is the Requested License Key Allowed',
  `loggedin` tinyint(4) NOT NULL DEFAULT '0',
  `lastaccessed` int(11) DEFAULT NULL,
  `inc_schedule` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Will this default be used in the scheduling calcs',
  `email_alert` tinyint(1) NOT NULL DEFAULT '1',
  `alert_timeout` int(11) NOT NULL DEFAULT '0',
  `ClientAddress` varchar(100) DEFAULT NULL,
  `MediaInventoryStatus` tinyint(4) NOT NULL DEFAULT '0',
  `MediaInventoryXml` longtext,
  `MacAddress` varchar(254) DEFAULT NULL COMMENT 'Mac Address of the Client',
  `LastChanged` int(11) DEFAULT NULL COMMENT 'Last time this Mac Address changed',
  `NumberOfMacAddressChanges` int(11) NOT NULL DEFAULT '0',
  `LastWakeOnLanCommandSent` int(11) DEFAULT NULL,
  `WakeOnLan` tinyint(4) NOT NULL DEFAULT '0',
  `WakeOnLanTime` varchar(5) DEFAULT NULL,
  `BroadCastAddress` varchar(100) DEFAULT NULL,
  `SecureOn` varchar(17) DEFAULT NULL,
  `Cidr` varchar(6) DEFAULT NULL,
  `GeoLocation` point DEFAULT NULL,
  `version_instructions` varchar(255) DEFAULT NULL,
  `client_type` varchar(20) DEFAULT NULL,
  `client_version` varchar(15) DEFAULT NULL,
  `client_code` smallint(6) DEFAULT NULL,
  `displayprofileid` int(11) DEFAULT NULL,
  `currentLayoutId` int(11) DEFAULT NULL,
  `screenShotRequested` tinyint(4) NOT NULL DEFAULT '0',
  `storageAvailableSpace` bigint(20) DEFAULT NULL,
  `storageTotalSpace` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`displayid`),
  KEY `defaultplaylistid` (`defaultlayoutid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `displaygroup`
--

CREATE TABLE IF NOT EXISTS `displaygroup` (
  `DisplayGroupID` int(11) NOT NULL AUTO_INCREMENT,
  `DisplayGroup` varchar(50) NOT NULL,
  `Description` varchar(254) DEFAULT NULL,
  `IsDisplaySpecific` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`DisplayGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `displayprofile`
--

CREATE TABLE IF NOT EXISTS `displayprofile` (
  `displayprofileid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` varchar(15) NOT NULL,
  `config` text NOT NULL,
  `isdefault` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`displayprofileid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Tablo döküm verisi `displayprofile`
--

INSERT INTO `displayprofile` (`displayprofileid`, `name`, `type`, `config`, `isdefault`, `userid`) VALUES
(1, 'Windows', 'windows', '[]', 1, 1),
(2, 'Android', 'android', '[]', 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `file`
--

CREATE TABLE IF NOT EXISTS `file` (
  `FileID` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedDT` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`FileID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `groupID` int(11) NOT NULL AUTO_INCREMENT,
  `group` varchar(50) NOT NULL,
  `IsUserSpecific` tinyint(4) NOT NULL DEFAULT '0',
  `IsEveryone` tinyint(4) NOT NULL DEFAULT '0',
  `libraryQuota` int(11) DEFAULT NULL,
  PRIMARY KEY (`groupID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Groups' AUTO_INCREMENT=4 ;

--
-- Tablo döküm verisi `group`
--

INSERT INTO `group` (`groupID`, `group`, `IsUserSpecific`, `IsEveryone`, `libraryQuota`) VALUES
(1, 'Users', 0, 0, NULL),
(2, 'Everyone', 0, 1, NULL),
(3, 'root', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `help`
--

CREATE TABLE IF NOT EXISTS `help` (
  `HelpID` int(11) NOT NULL AUTO_INCREMENT,
  `Topic` varchar(254) NOT NULL,
  `Category` varchar(254) NOT NULL DEFAULT 'General',
  `Link` varchar(254) NOT NULL,
  PRIMARY KEY (`HelpID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=85 ;

--
-- Tablo döküm verisi `help`
--

INSERT INTO `help` (`HelpID`, `Topic`, `Category`, `Link`) VALUES
(1, 'Layout', 'General', 'layouts.html'),
(2, 'Content', 'General', 'media.html'),
(4, 'Schedule', 'General', 'scheduling.html'),
(5, 'Group', 'General', 'users_groups.html'),
(6, 'Admin', 'General', 'cms_settings.html'),
(7, 'Report', 'General', 'troubleshooting.html'),
(8, 'Dashboard', 'General', 'tour.html'),
(9, 'User', 'General', 'users.html'),
(10, 'Display', 'General', 'displays.html'),
(11, 'DisplayGroup', 'General', 'displays_groups.html'),
(12, 'Layout', 'Add', 'layouts.html#Add_Layout'),
(13, 'Layout', 'Background', 'layouts_designer.html#Background'),
(14, 'Content', 'Assign', 'layouts_playlists.html#Assigning_Content'),
(15, 'Layout', 'RegionOptions', 'layouts_regions.html'),
(16, 'Content', 'AddtoLibrary', 'media_library.html'),
(17, 'Display', 'Edit', 'displays.html#Display_Edit'),
(18, 'Display', 'Delete', 'displays.html#Display_Delete'),
(19, 'Displays', 'Groups', 'displays_groups.html#Group_Members'),
(20, 'UserGroup', 'Add', 'users_groups.html#Adding_Group'),
(21, 'User', 'Add', 'users_administration.html#Add_User'),
(22, 'User', 'Delete', 'users_administration.html#Delete_User'),
(23, 'Content', 'Config', 'cms_settings.html#Content'),
(24, 'LayoutMedia', 'Permissions', 'users_permissions.html'),
(25, 'Region', 'Permissions', 'users_permissions.html'),
(26, 'Library', 'Assign', 'layouts_playlists.html#Add_From_Library'),
(27, 'Media', 'Delete', 'media_library.html#Delete'),
(28, 'DisplayGroup', 'Add', 'displays_groups.html#Add_Group'),
(29, 'DisplayGroup', 'Edit', 'displays_groups.html#Edit_Group'),
(30, 'DisplayGroup', 'Delete', 'displays_groups.html#Delete_Group'),
(31, 'DisplayGroup', 'Members', 'displays_groups.html#Group_Members'),
(32, 'DisplayGroup', 'Permissions', 'users_permissions.html'),
(34, 'Schedule', 'ScheduleNow', 'scheduling_now.html'),
(35, 'Layout', 'Delete', 'layouts.html#Delete_Layout'),
(36, 'Layout', 'Copy', 'layouts.html#Copy_Layout'),
(37, 'Schedule', 'Edit', 'scheduling_events.html#Edit'),
(38, 'Schedule', 'Add', 'scheduling_events.html#Add'),
(39, 'Layout', 'Permissions', 'users_permissions.html'),
(40, 'Display', 'MediaInventory', 'displays.html#Media_Inventory'),
(41, 'User', 'ChangePassword', 'users.html#Change_Password'),
(42, 'Schedule', 'Delete', 'scheduling_events.html'),
(43, 'Layout', 'Edit', 'layouts_designer.html#Edit_Layout'),
(44, 'Media', 'Permissions', 'users_permissions.html'),
(45, 'Display', 'DefaultLayout', 'displays.html#DefaultLayout'),
(46, 'UserGroup', 'Edit', 'users_groups.html#Edit_Group'),
(47, 'UserGroup', 'Members', 'users_groups.html#Group_Member'),
(48, 'User', 'PageSecurity', 'users_permissions.html#Page_Security'),
(49, 'User', 'MenuSecurity', 'users_permissions.html#Menu_Security'),
(50, 'UserGroup', 'Delete', 'users_groups.html#Delete_Group'),
(51, 'User', 'Edit', 'users_administration.html#Edit_User'),
(52, 'User', 'Applications', 'users_administration.html#Users_MyApplications'),
(53, 'User', 'SetHomepage', 'users_administration.html#Media_Dashboard'),
(54, 'DataSet', 'General', 'media_datasets.html'),
(55, 'DataSet', 'Add', 'media_datasets.html#Create_Dataset'),
(56, 'DataSet', 'Edit', 'media_datasets.html#Edit_Dataset'),
(57, 'DataSet', 'Delete', 'media_datasets.html#Delete_Dataset'),
(58, 'DataSet', 'AddColumn', 'media_datasets.html#Dataset_Column'),
(59, 'DataSet', 'EditColumn', 'media_datasets.html#Dataset_Column'),
(60, 'DataSet', 'DeleteColumn', 'media_datasets.html#Dataset_Column'),
(61, 'DataSet', 'Data', 'media_datasets.html#Dataset_Row'),
(62, 'DataSet', 'Permissions', 'users_permissions.html'),
(63, 'Fault', 'General', 'troubleshooting.html#Report_Fault'),
(65, 'Stats', 'General', 'displays_metrics.html'),
(66, 'Resolution', 'General', 'layouts_resolutions.html'),
(67, 'Template', 'General', 'layouts_templates.html'),
(68, 'Services', 'Register', '#Registered_Applications'),
(69, 'OAuth', 'General', 'api_oauth.html'),
(70, 'Services', 'Log', 'api_oauth.html#oAuthLog'),
(71, 'Module', 'Edit', 'media_modules.html'),
(72, 'Module', 'General', 'media_modules.html'),
(73, 'Campaign', 'General', 'layouts_campaigns.html'),
(74, 'License', 'General', 'licence_information.html'),
(75, 'DataSet', 'ViewColumns', 'media_datasets.html#Dataset_Column'),
(76, 'Campaign', 'Permissions', 'users_permissions.html'),
(77, 'Transition', 'Edit', 'layouts_transitions.html'),
(78, 'User', 'SetPassword', 'users_administration.html#Set_Password'),
(79, 'DataSet', 'ImportCSV', 'media_datasets.htmlmedia_datasets.html#Import_CSV'),
(80, 'DisplayGroup', 'FileAssociations', 'displays_fileassociations.html'),
(81, 'Statusdashboard', 'General', 'tour_status_dashboard.html'),
(82, 'Displayprofile', 'General', 'displays_settings.html'),
(83, 'DisplayProfile', 'Edit', 'displays_settings.html#edit'),
(84, 'DisplayProfile', 'Delete', 'displays_settings.html#delete');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `layout`
--

CREATE TABLE IF NOT EXISTS `layout` (
  `layoutID` int(11) NOT NULL AUTO_INCREMENT,
  `layout` varchar(50) NOT NULL,
  `xml` longtext NOT NULL,
  `userID` int(11) NOT NULL COMMENT 'The UserID that created this layout',
  `createdDT` datetime NOT NULL,
  `modifiedDT` datetime NOT NULL,
  `description` varchar(254) DEFAULT NULL,
  `tags` varchar(254) DEFAULT NULL,
  `retired` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Is this layout retired',
  `duration` int(11) NOT NULL DEFAULT '0' COMMENT 'The duration in seconds',
  `backgroundImageId` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`layoutID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Layouts' AUTO_INCREMENT=6 ;

--
-- Tablo döküm verisi `layout`
--

INSERT INTO `layout` (`layoutID`, `layout`, `xml`, `userID`, `createdDT`, `modifiedDT`, `description`, `tags`, `retired`, `duration`, `backgroundImageId`, `status`) VALUES
(5, 'Default Layout', '<?xml version="1.0"?>\n<layout schemaVersion="2" width="1920" height="1080" bgcolor="#000000" background="" resolutionid="9">\n  <region id="47ff29524ce1b" width="1920" height="935.99999999999" top="0" left="0" userId="1">\n    <media id="522caef6e13cb6c9fe5fac15dde59ef7" type="text" duration="15" lkid="" userId="1" schemaVersion="1" render="native">\n                            <options><xmds>1</xmds><direction>none</direction><scrollSpeed>2</scrollSpeed><fitText>0</fitText></options>\n                            <raw><text><![CDATA[<p style="text-align: center;"><span style="font-size:168px;"><strong><span style="font-family:arial,helvetica,sans-serif;"><span style="color:#FFFFFF;">Welcome to Xibo</span></span></strong></span></p>\n\n<p style="text-align: center;"><span style="font-size:80px;"><span style="font-family:arial,helvetica,sans-serif;"><span style="color:#FFFFFF;">Open Source Digital Signage</span></span></span></p>\n\n<p style="text-align: center;"><span style="font-size:48px;"><span style="color:#D3D3D3;"><span style="font-family:arial,helvetica,sans-serif;">This is the default layout - please feel free to change it whenever you like.</span></span></span></p>\n]]></text></raw>\n                    </media>\n  </region>\n  <region id="53654d56726e0" userId="1" width="432" height="129.23076923077" top="940.78846153846" left="1470.4903846154">\n    <media id="11846d5d9f686fb75fc9dad0b19ca9de" type="text" duration="10" lkid="" userId="1" schemaVersion="1" render="native">\n                            <options><xmds>1</xmds><direction>none</direction><scrollSpeed>2</scrollSpeed><fitText>0</fitText></options>\n                            <raw><text><![CDATA[<p style="text-align: right;"><span style="font-size:96px;"><span style="font-family:arial,helvetica,sans-serif;"><span style="color:#D3D3D3;">[Clock]</span></span></span></p>\n]]></text></raw>\n                    </media>\n  <options><transOut/><transOutDuration>0</transOutDuration><transOutDirection/></options></region>\n  <tags>\n    <tag>default</tag>\n  </tags>\n</layout>\n', 1, '2015-09-21 09:58:19', '2015-09-21 12:58:19', '', NULL, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lkcampaigngroup`
--

CREATE TABLE IF NOT EXISTS `lkcampaigngroup` (
  `LkCampaignGroupID` int(11) NOT NULL AUTO_INCREMENT,
  `CampaignID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL,
  `View` tinyint(4) NOT NULL DEFAULT '0',
  `Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Del` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LkCampaignGroupID`),
  KEY `CampaignID` (`CampaignID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lkcampaignlayout`
--

CREATE TABLE IF NOT EXISTS `lkcampaignlayout` (
  `LkCampaignLayoutID` int(11) NOT NULL AUTO_INCREMENT,
  `CampaignID` int(11) NOT NULL,
  `LayoutID` int(11) NOT NULL,
  `DisplayOrder` int(11) NOT NULL,
  PRIMARY KEY (`LkCampaignLayoutID`),
  KEY `CampaignID` (`CampaignID`),
  KEY `LayoutID` (`LayoutID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Tablo döküm verisi `lkcampaignlayout`
--

INSERT INTO `lkcampaignlayout` (`LkCampaignLayoutID`, `CampaignID`, `LayoutID`, `DisplayOrder`) VALUES
(2, 2, 5, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lkdatasetgroup`
--

CREATE TABLE IF NOT EXISTS `lkdatasetgroup` (
  `LkDataSetGroupID` int(11) NOT NULL AUTO_INCREMENT,
  `DataSetID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL,
  `View` tinyint(4) NOT NULL DEFAULT '0',
  `Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Del` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LkDataSetGroupID`),
  KEY `DataSetID` (`DataSetID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lkdatasetlayout`
--

CREATE TABLE IF NOT EXISTS `lkdatasetlayout` (
  `LkDataSetLayoutID` int(11) NOT NULL AUTO_INCREMENT,
  `DataSetID` int(11) NOT NULL,
  `LayoutID` int(11) NOT NULL,
  `RegionID` varchar(50) NOT NULL,
  `MediaID` varchar(50) NOT NULL,
  PRIMARY KEY (`LkDataSetLayoutID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lkdisplaydg`
--

CREATE TABLE IF NOT EXISTS `lkdisplaydg` (
  `LkDisplayDGID` int(11) NOT NULL AUTO_INCREMENT,
  `DisplayGroupID` int(11) NOT NULL,
  `DisplayID` int(11) NOT NULL,
  PRIMARY KEY (`LkDisplayDGID`),
  KEY `DisplayGroupID` (`DisplayGroupID`),
  KEY `DisplayID` (`DisplayID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lkdisplaygroupgroup`
--

CREATE TABLE IF NOT EXISTS `lkdisplaygroupgroup` (
  `LkDisplayGroupGroupID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL,
  `DisplayGroupID` int(11) NOT NULL,
  `View` tinyint(4) NOT NULL DEFAULT '0',
  `Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Del` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LkDisplayGroupGroupID`),
  KEY `GroupID` (`GroupID`),
  KEY `DisplayGroupID` (`DisplayGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lklayoutmedia`
--

CREATE TABLE IF NOT EXISTS `lklayoutmedia` (
  `lklayoutmediaID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The ID',
  `mediaID` int(11) NOT NULL,
  `layoutID` int(11) NOT NULL,
  `regionID` varchar(50) NOT NULL COMMENT 'Region ID in the XML',
  PRIMARY KEY (`lklayoutmediaID`),
  KEY `mediaID` (`mediaID`),
  KEY `layoutID` (`layoutID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Creates a reference between Layout and Media' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lklayoutmediagroup`
--

CREATE TABLE IF NOT EXISTS `lklayoutmediagroup` (
  `LkLayoutMediaGroup` int(11) NOT NULL AUTO_INCREMENT,
  `LayoutID` int(11) NOT NULL,
  `RegionID` varchar(50) NOT NULL,
  `MediaID` varchar(50) NOT NULL,
  `GroupID` int(11) NOT NULL,
  `View` tinyint(4) NOT NULL DEFAULT '0',
  `Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Del` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LkLayoutMediaGroup`),
  KEY `LayoutID` (`LayoutID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lklayoutregiongroup`
--

CREATE TABLE IF NOT EXISTS `lklayoutregiongroup` (
  `LkLayoutRegionGroup` int(11) NOT NULL AUTO_INCREMENT,
  `LayoutID` int(11) NOT NULL,
  `RegionID` varchar(50) NOT NULL,
  `GroupID` int(11) NOT NULL,
  `View` tinyint(4) NOT NULL DEFAULT '0',
  `Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Del` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LkLayoutRegionGroup`),
  KEY `LayoutID` (`LayoutID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lkmediadisplaygroup`
--

CREATE TABLE IF NOT EXISTS `lkmediadisplaygroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mediaid` int(11) NOT NULL,
  `displaygroupid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='File associations directly to Display Groups' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lkmediagroup`
--

CREATE TABLE IF NOT EXISTS `lkmediagroup` (
  `LkMediaGroupID` int(11) NOT NULL AUTO_INCREMENT,
  `MediaID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL,
  `View` tinyint(4) NOT NULL DEFAULT '0',
  `Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Del` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LkMediaGroupID`),
  KEY `MediaID` (`MediaID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lkmenuitemgroup`
--

CREATE TABLE IF NOT EXISTS `lkmenuitemgroup` (
  `LkMenuItemGroupID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL,
  `MenuItemID` int(11) NOT NULL,
  PRIMARY KEY (`LkMenuItemGroupID`),
  KEY `GroupID` (`GroupID`),
  KEY `MenuItemID` (`MenuItemID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Tablo döküm verisi `lkmenuitemgroup`
--

INSERT INTO `lkmenuitemgroup` (`LkMenuItemGroupID`, `GroupID`, `MenuItemID`) VALUES
(1, 1, 33),
(2, 1, 14),
(3, 1, 15),
(4, 1, 16),
(5, 1, 20),
(6, 1, 24),
(7, 1, 1),
(8, 1, 2),
(9, 1, 3),
(10, 1, 29),
(11, 1, 30),
(12, 1, 26);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lkpagegroup`
--

CREATE TABLE IF NOT EXISTS `lkpagegroup` (
  `lkpagegroupID` int(11) NOT NULL AUTO_INCREMENT,
  `pageID` int(11) NOT NULL,
  `groupID` int(11) NOT NULL,
  PRIMARY KEY (`lkpagegroupID`),
  KEY `pageID` (`pageID`),
  KEY `groupID` (`groupID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Pages available to groups' AUTO_INCREMENT=11 ;

--
-- Tablo döküm verisi `lkpagegroup`
--

INSERT INTO `lkpagegroup` (`lkpagegroupID`, `pageID`, `groupID`) VALUES
(1, 2, 1),
(2, 1, 1),
(3, 3, 1),
(4, 19, 1),
(5, 5, 1),
(6, 7, 1),
(7, 24, 1),
(8, 39, 1),
(9, 41, 1),
(10, 42, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lktaglayout`
--

CREATE TABLE IF NOT EXISTS `lktaglayout` (
  `lkTagLayoutId` int(11) NOT NULL AUTO_INCREMENT,
  `tagId` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  PRIMARY KEY (`lkTagLayoutId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Tablo döküm verisi `lktaglayout`
--

INSERT INTO `lktaglayout` (`lkTagLayoutId`, `tagId`, `layoutId`) VALUES
(1, 4, 5),
(2, 5, 5);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lktagmedia`
--

CREATE TABLE IF NOT EXISTS `lktagmedia` (
  `lkTagMediaId` int(11) NOT NULL AUTO_INCREMENT,
  `tagId` int(11) NOT NULL,
  `mediaId` int(11) NOT NULL,
  PRIMARY KEY (`lkTagMediaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lkusergroup`
--

CREATE TABLE IF NOT EXISTS `lkusergroup` (
  `LkUserGroupID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`LkUserGroupID`),
  KEY `GroupID` (`GroupID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Tablo döküm verisi `lkusergroup`
--

INSERT INTO `lkusergroup` (`LkUserGroupID`, `GroupID`, `UserID`) VALUES
(10, 3, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `logid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'The log ID',
  `logdate` datetime NOT NULL COMMENT 'The log date',
  `type` enum('error','audit') NOT NULL,
  `page` varchar(50) NOT NULL,
  `function` varchar(50) DEFAULT NULL,
  `message` longtext NOT NULL,
  `RequestUri` varchar(2000) DEFAULT NULL,
  `RemoteAddr` varchar(254) DEFAULT NULL,
  `userID` int(11) NOT NULL DEFAULT '0',
  `UserAgent` varchar(254) DEFAULT NULL,
  `scheduleID` int(11) DEFAULT NULL,
  `displayID` int(11) DEFAULT NULL,
  `layoutID` int(11) DEFAULT NULL,
  `mediaID` int(11) DEFAULT NULL,
  PRIMARY KEY (`logid`),
  KEY `logdate` (`logdate`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=375 ;

--
-- Tablo döküm verisi `log`
--

INSERT INTO `log` (`logid`, `logdate`, `type`, `page`, `function`, `message`, `RequestUri`, `RemoteAddr`, `userID`, `UserAgent`, `scheduleID`, `displayID`, `layoutID`, `mediaID`) VALUES
(372, '2015-09-21 10:01:17', 'error', '', '', '<errormsg>No displays with View permissions</errormsg>\n<errornum>256</errornum>\n<errortype>User Error</errortype>\n<scriptname>C:\\Development\\Projects\\Web\\Php\\xibo-cms\\lib\\pages\\stats.class.php</scriptname>\n<scriptlinenum>362</scriptlinenum>\n', '/xibo-cms/index.php?ajax=true', '::1', 1, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 0, 0, 0, 0),
(373, '2015-09-21 10:01:17', 'error', '', '', '<errormsg>No displays with View permissions</errormsg>\n<errornum>256</errornum>\n<errortype>User Error</errortype>\n<scriptname>C:\\Development\\Projects\\Web\\Php\\xibo-cms\\lib\\pages\\stats.class.php</scriptname>\n<scriptlinenum>443</scriptlinenum>\n', '/xibo-cms/index.php?ajax=true', '::1', 1, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 0, 0, 0, 0),
(374, '2015-09-21 10:01:17', 'error', '', '', '<errormsg>No displays with View permissions</errormsg>\n<errornum>256</errornum>\n<errortype>User Error</errortype>\n<scriptname>C:\\Development\\Projects\\Web\\Php\\xibo-cms\\lib\\pages\\stats.class.php</scriptname>\n<scriptlinenum>172</scriptlinenum>\n', '/xibo-cms/index.php?ajax=true', '::1', 1, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `media`
--

CREATE TABLE IF NOT EXISTS `media` (
  `mediaID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(15) NOT NULL,
  `duration` int(11) NOT NULL,
  `originalFilename` varchar(254) DEFAULT NULL,
  `storedAs` varchar(254) DEFAULT NULL COMMENT 'What has this media been stored as',
  `MD5` varchar(32) DEFAULT NULL,
  `FileSize` bigint(20) DEFAULT NULL,
  `userID` int(11) NOT NULL,
  `retired` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Is retired?',
  `isEdited` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Is this the current record',
  `editedMediaID` int(11) DEFAULT NULL COMMENT 'The Parent ID',
  `moduleSystemFile` tinyint(1) NOT NULL DEFAULT '0',
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `expires` int(11) DEFAULT NULL,
  PRIMARY KEY (`mediaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Tablo döküm verisi `media`
--

INSERT INTO `media` (`mediaID`, `name`, `type`, `duration`, `originalFilename`, `storedAs`, `MD5`, `FileSize`, `userID`, `retired`, `isEdited`, `editedMediaID`, `moduleSystemFile`, `valid`, `expires`) VALUES
(9, 'jquery-1.11.1.min.js', 'module', 10, 'jquery-1.11.1.min.js', 'jquery-1.11.1.min.js', '3c9137d88a00b1ae0b41ff6a70571615', 95785, 1, 0, 0, NULL, 1, 1, 0),
(10, 'xibo-layout-scaler.js', 'module', 10, 'xibo-layout-scaler.js', 'xibo-layout-scaler.js', '3659986d00e56c929218084aeb991cca', 2466, 1, 0, 0, NULL, 1, 1, 0),
(11, 'xibo-webpage-render.js', 'module', 10, 'xibo-webpage-render.js', 'xibo-webpage-render.js', 'd59f5fc84ef7747f27baddc07fe81487', 4832, 1, 0, 0, NULL, 1, 1, 0),
(12, 'moment.js', 'module', 10, 'moment.js', 'moment.js', '67bb26c11dba6c366834e65f5933aff2', 160251, 1, 0, 0, NULL, 1, 1, 0),
(13, 'jquery.marquee.min.js', 'module', 10, 'jquery.marquee.min.js', 'jquery.marquee.min.js', '2286bb4f44d9ea301131a25c5204ca0a', 2248, 1, 0, 0, NULL, 1, 1, 0),
(14, 'jquery-cycle-2.1.6.min.js', 'module', 10, 'jquery-cycle-2.1.6.min.js', 'jquery-cycle-2.1.6.min.js', '4310a8127c98c2fc13d1f6597c338e6f', 28669, 1, 0, 0, NULL, 1, 1, 0),
(15, 'xibo-text-render.js', 'module', 10, 'xibo-text-render.js', 'xibo-text-render.js', '55991caa2c44b85d0604349da0f8c42b', 9086, 1, 0, 0, NULL, 1, 1, 0),
(16, 'xibo-dataset-render.js', 'module', 10, 'xibo-dataset-render.js', 'xibo-dataset-render.js', 'ffcde6f93e4ac6cb6d4dddad45d344db', 1585, 1, 0, 0, NULL, 1, 1, 0),
(17, 'flipclock.min.js', 'module', 10, 'flipclock.min.js', 'flipclock.min.js', 'cd44dfb10cf85968f429871c1334ee78', 20242, 1, 0, 0, NULL, 1, 1, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `MenuID` smallint(6) NOT NULL AUTO_INCREMENT,
  `Menu` varchar(50) NOT NULL,
  PRIMARY KEY (`MenuID`),
  UNIQUE KEY `Menu` (`Menu`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='A Menu (or collection of links)' AUTO_INCREMENT=10 ;

--
-- Tablo döküm verisi `menu`
--

INSERT INTO `menu` (`MenuID`, `Menu`) VALUES
(8, 'Administration Menu'),
(9, 'Advanced Menu'),
(2, 'Dashboard'),
(6, 'Design Menu'),
(7, 'Display Menu'),
(5, 'Library Menu'),
(1, 'Top Nav');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `menuitem`
--

CREATE TABLE IF NOT EXISTS `menuitem` (
  `MenuItemID` int(11) NOT NULL AUTO_INCREMENT,
  `MenuID` smallint(6) NOT NULL,
  `PageID` int(11) NOT NULL,
  `Args` varchar(254) DEFAULT NULL,
  `Text` varchar(20) NOT NULL,
  `Class` varchar(50) DEFAULT NULL,
  `Img` varchar(254) DEFAULT NULL,
  `Sequence` smallint(6) NOT NULL DEFAULT '1',
  `External` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MenuItemID`),
  KEY `PageID` (`PageID`),
  KEY `MenuID` (`MenuID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Tablo döküm verisi `menuitem`
--

INSERT INTO `menuitem` (`MenuItemID`, `MenuID`, `PageID`, `Args`, `Text`, `Class`, `Img`, `Sequence`, `External`) VALUES
(1, 1, 2, NULL, 'Schedule', NULL, NULL, 1, 0),
(2, 1, 5, NULL, 'Design', NULL, NULL, 2, 0),
(3, 1, 7, NULL, 'Library', NULL, NULL, 3, 0),
(4, 1, 17, NULL, 'Administration', NULL, NULL, 5, 0),
(7, 7, 11, NULL, 'Displays', NULL, NULL, 1, 0),
(8, 8, 15, NULL, 'User Groups', NULL, NULL, 2, 0),
(9, 8, 17, NULL, 'Users', NULL, NULL, 1, 0),
(10, 9, 16, NULL, 'Log', NULL, NULL, 1, 0),
(11, 9, 18, NULL, 'About', NULL, NULL, 4, 0),
(12, 9, 40, NULL, 'Sessions', NULL, NULL, 2, 0),
(13, 8, 14, NULL, 'Settings', NULL, NULL, 3, 0),
(14, 2, 2, 'sp=month', 'Schedule', 'schedule_button', 'dashboard/scheduleview.png', 1, 0),
(15, 2, 5, NULL, 'Layouts', 'playlist_button', 'dashboard/presentations.png', 2, 0),
(16, 2, 7, NULL, 'Library', 'content_button', 'dashboard/content.png', 3, 0),
(17, 2, 25, NULL, 'Templates', 'layout_button', 'dashboard/layouts.png', 4, 0),
(18, 2, 17, NULL, 'Users', 'user_button', 'dashboard/users.png', 5, 0),
(19, 2, 14, NULL, 'Settings', 'settings_button', 'dashboard/settings.png', 6, 0),
(20, 2, 18, NULL, 'About', 'license_button', 'dashboard/license.png', 7, 0),
(22, 9, 26, NULL, 'Report Fault', NULL, NULL, 3, 0),
(23, 7, 27, NULL, 'Statistics', NULL, NULL, 3, 0),
(24, 2, 28, 'manual/index.php', 'Manual', 'help_button', 'dashboard/help.png', 10, 1),
(25, 6, 29, NULL, 'Resolutions', NULL, NULL, 4, 0),
(26, 6, 25, NULL, 'Templates', NULL, NULL, 3, 0),
(27, 7, 32, NULL, 'Display Groups', NULL, NULL, 2, 0),
(28, 8, 33, NULL, 'Applications', NULL, NULL, 4, 0),
(29, 5, 36, NULL, 'DataSets', NULL, NULL, 2, 0),
(30, 5, 7, NULL, 'Media', NULL, NULL, 1, 0),
(33, 6, 5, NULL, 'Layouts', NULL, NULL, 2, 0),
(34, 1, 11, NULL, 'Displays', NULL, NULL, 4, 0),
(35, 1, 16, NULL, 'Advanced', NULL, NULL, 6, 0),
(36, 8, 24, NULL, 'Modules', NULL, NULL, 5, 0),
(37, 6, 37, NULL, 'Campaigns', NULL, NULL, 1, 0),
(38, 8, 38, NULL, 'Transitions', NULL, NULL, 6, 0),
(39, 9, 30, NULL, 'Help Links', NULL, NULL, 6, 0),
(40, 7, 43, NULL, 'Display Settings', NULL, NULL, 4, 0),
(41, 9, 44, NULL, 'Audit Trail', NULL, NULL, 2, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `module`
--

CREATE TABLE IF NOT EXISTS `module` (
  `ModuleID` int(11) NOT NULL AUTO_INCREMENT,
  `Module` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Enabled` tinyint(4) NOT NULL DEFAULT '0',
  `RegionSpecific` tinyint(4) NOT NULL DEFAULT '1',
  `Description` varchar(254) DEFAULT NULL,
  `ImageUri` varchar(254) NOT NULL,
  `SchemaVersion` int(11) NOT NULL DEFAULT '1',
  `ValidExtensions` varchar(254) DEFAULT NULL,
  `PreviewEnabled` tinyint(4) NOT NULL DEFAULT '1',
  `assignable` tinyint(4) NOT NULL DEFAULT '1',
  `render_as` varchar(10) DEFAULT NULL,
  `settings` text,
  PRIMARY KEY (`ModuleID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Functional Modules' AUTO_INCREMENT=17 ;

--
-- Tablo döküm verisi `module`
--

INSERT INTO `module` (`ModuleID`, `Module`, `Name`, `Enabled`, `RegionSpecific`, `Description`, `ImageUri`, `SchemaVersion`, `ValidExtensions`, `PreviewEnabled`, `assignable`, `render_as`, `settings`) VALUES
(1, 'Image', 'Image', 1, 0, 'Images. PNG, JPG, BMP, GIF', 'forms/image.gif', 1, 'jpg,jpeg,png,bmp,gif', 1, 1, NULL, NULL),
(2, 'Video', 'Video', 1, 0, 'Videos - support varies depending on the client hardware you are using.', 'forms/video.gif', 1, 'wmv,avi,mpg,mpeg,webm,mp4', 1, 1, NULL, NULL),
(3, 'Flash', 'Flash', 1, 0, 'Flash', 'forms/flash.gif', 1, 'swf', 1, 1, NULL, NULL),
(4, 'PowerPoint', 'PowerPoint', 1, 0, 'Powerpoint. PPT, PPS', 'forms/powerpoint.gif', 1, 'ppt,pps,pptx', 1, 1, NULL, NULL),
(5, 'Webpage', 'Webpage', 1, 1, 'Webpages.', 'forms/webpage.gif', 1, NULL, 1, 1, NULL, NULL),
(6, 'Ticker', 'Ticker', 1, 1, 'RSS Ticker.', 'forms/ticker.gif', 1, NULL, 1, 1, NULL, '[]'),
(7, 'Text', 'Text', 1, 1, 'Text. With Directional Controls.', 'forms/text.gif', 1, NULL, 1, 1, NULL, NULL),
(8, 'Embedded', 'Embedded', 1, 1, 'Embedded HTML', 'forms/webpage.gif', 1, NULL, 1, 1, NULL, NULL),
(10, 'Counter', 'Counter', 0, 1, 'Customer Counter connected to a Remote Control', 'forms/counter.gif', 1, NULL, 1, 1, NULL, NULL),
(11, 'datasetview', 'Data Set', 1, 1, 'A view on a DataSet', 'forms/datasetview.gif', 1, NULL, 1, 1, NULL, NULL),
(12, 'shellcommand', 'Shell Command', 1, 1, 'Execute a shell command on the client', 'forms/shellcommand.gif', 1, NULL, 1, 1, NULL, NULL),
(13, 'localvideo', 'Local Video', 1, 1, 'Play a video locally stored on the client', 'forms/video.gif', 1, NULL, 1, 1, NULL, NULL),
(14, 'genericfile', 'Generic File', 1, 0, 'A generic file to be stored in the library', 'forms/library.gif', 1, 'apk,js,html,htm', 0, 0, NULL, NULL),
(15, 'clock', 'Clock', 1, 1, 'Display a Clock', 'forms/library.gif', 1, NULL, 1, 1, 'html', NULL),
(16, 'font', 'Font', 1, 0, 'A font to use in other Modules', 'forms/library.gif', 1, 'ttf,otf,eot,svg,woff', 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oauth_log`
--

CREATE TABLE IF NOT EXISTS `oauth_log` (
  `olg_id` int(11) NOT NULL AUTO_INCREMENT,
  `olg_osr_consumer_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `olg_ost_token` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `olg_ocr_consumer_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `olg_oct_token` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `olg_usa_id_ref` int(11) DEFAULT NULL,
  `olg_received` text NOT NULL,
  `olg_sent` text NOT NULL,
  `olg_base_string` text NOT NULL,
  `olg_notes` text NOT NULL,
  `olg_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `olg_remote_ip` bigint(20) NOT NULL,
  PRIMARY KEY (`olg_id`),
  KEY `olg_osr_consumer_key` (`olg_osr_consumer_key`,`olg_id`),
  KEY `olg_ost_token` (`olg_ost_token`,`olg_id`),
  KEY `olg_ocr_consumer_key` (`olg_ocr_consumer_key`,`olg_id`),
  KEY `olg_oct_token` (`olg_oct_token`,`olg_id`),
  KEY `olg_usa_id_ref` (`olg_usa_id_ref`,`olg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oauth_server_nonce`
--

CREATE TABLE IF NOT EXISTS `oauth_server_nonce` (
  `osn_id` int(11) NOT NULL AUTO_INCREMENT,
  `osn_consumer_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `osn_token` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `osn_timestamp` bigint(20) NOT NULL,
  `osn_nonce` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`osn_id`),
  UNIQUE KEY `osn_consumer_key` (`osn_consumer_key`,`osn_token`,`osn_timestamp`,`osn_nonce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oauth_server_registry`
--

CREATE TABLE IF NOT EXISTS `oauth_server_registry` (
  `osr_id` int(11) NOT NULL AUTO_INCREMENT,
  `osr_usa_id_ref` int(11) DEFAULT NULL,
  `osr_consumer_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `osr_consumer_secret` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `osr_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `osr_status` varchar(16) NOT NULL,
  `osr_requester_name` varchar(64) NOT NULL,
  `osr_requester_email` varchar(64) NOT NULL,
  `osr_callback_uri` varchar(255) NOT NULL,
  `osr_application_uri` varchar(255) NOT NULL,
  `osr_application_title` varchar(80) NOT NULL,
  `osr_application_descr` text NOT NULL,
  `osr_application_notes` text NOT NULL,
  `osr_application_type` varchar(20) NOT NULL,
  `osr_application_commercial` tinyint(1) NOT NULL DEFAULT '0',
  `osr_issue_date` datetime NOT NULL,
  `osr_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`osr_id`),
  UNIQUE KEY `osr_consumer_key` (`osr_consumer_key`),
  KEY `osr_usa_id_ref` (`osr_usa_id_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oauth_server_token`
--

CREATE TABLE IF NOT EXISTS `oauth_server_token` (
  `ost_id` int(11) NOT NULL AUTO_INCREMENT,
  `ost_osr_id_ref` int(11) NOT NULL,
  `ost_usa_id_ref` int(11) NOT NULL,
  `ost_token` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ost_token_secret` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ost_token_type` enum('request','access') DEFAULT NULL,
  `ost_authorized` tinyint(1) NOT NULL DEFAULT '0',
  `ost_referrer_host` varchar(128) NOT NULL,
  `ost_token_ttl` datetime NOT NULL DEFAULT '9999-12-31 00:00:00',
  `ost_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ost_verifier` char(10) DEFAULT NULL,
  `ost_callback_url` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`ost_id`),
  UNIQUE KEY `ost_token` (`ost_token`),
  KEY `ost_osr_id_ref` (`ost_osr_id_ref`),
  KEY `ost_token_ttl` (`ost_token_ttl`),
  KEY `ost_usa_id_ref` (`ost_usa_id_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pagegroup`
--

CREATE TABLE IF NOT EXISTS `pagegroup` (
  `pagegroupID` int(11) NOT NULL AUTO_INCREMENT,
  `pagegroup` varchar(50) NOT NULL,
  PRIMARY KEY (`pagegroupID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Page Groups' AUTO_INCREMENT=15 ;

--
-- Tablo döküm verisi `pagegroup`
--

INSERT INTO `pagegroup` (`pagegroupID`, `pagegroup`) VALUES
(1, 'Schedule'),
(2, 'Homepage and Login'),
(3, 'Layouts'),
(4, 'Content'),
(7, 'Displays'),
(8, 'Users and Groups'),
(9, 'Reports'),
(10, 'License and Settings'),
(11, 'Updates'),
(12, 'Templates'),
(13, 'Web Services'),
(14, 'DataSets');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `pageID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pagegroupID` int(11) NOT NULL,
  PRIMARY KEY (`pageID`),
  KEY `pagegroupID` (`pagegroupID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Available Pages' AUTO_INCREMENT=45 ;

--
-- Tablo döküm verisi `pages`
--

INSERT INTO `pages` (`pageID`, `name`, `pagegroupID`) VALUES
(1, 'dashboard', 2),
(2, 'schedule', 1),
(3, 'mediamanager', 2),
(5, 'layout', 3),
(7, 'content', 4),
(11, 'display', 7),
(12, 'update', 11),
(14, 'admin', 10),
(15, 'group', 8),
(16, 'log', 9),
(17, 'user', 8),
(18, 'license', 10),
(19, 'index', 2),
(24, 'module', 4),
(25, 'template', 3),
(26, 'fault', 10),
(27, 'stats', 9),
(28, 'manual', 2),
(29, 'resolution', 12),
(30, 'help', 2),
(31, 'clock', 2),
(32, 'displaygroup', 7),
(33, 'oauth', 13),
(34, 'help', 2),
(35, 'clock', 2),
(36, 'dataset', 14),
(37, 'campaign', 3),
(38, 'transition', 4),
(39, 'timeline', 3),
(40, 'sessions', 9),
(41, 'preview', 3),
(42, 'statusdashboard', 2),
(43, 'displayprofile', 7),
(44, 'auditlog', 9);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `resolution`
--

CREATE TABLE IF NOT EXISTS `resolution` (
  `resolutionID` int(11) NOT NULL AUTO_INCREMENT,
  `resolution` varchar(254) NOT NULL,
  `width` smallint(6) NOT NULL,
  `height` smallint(6) NOT NULL,
  `intended_width` smallint(6) NOT NULL,
  `intended_height` smallint(6) NOT NULL,
  `version` tinyint(4) NOT NULL DEFAULT '1',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`resolutionID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Supported Resolutions' AUTO_INCREMENT=15 ;

--
-- Tablo döküm verisi `resolution`
--

INSERT INTO `resolution` (`resolutionID`, `resolution`, `width`, `height`, `intended_width`, `intended_height`, `version`, `enabled`) VALUES
(9, '1080p HD Landscape', 800, 450, 1920, 1080, 2, 1),
(10, '720p HD Landscape', 800, 450, 1280, 720, 2, 1),
(11, '1080p HD Portrait', 450, 800, 1080, 1920, 2, 1),
(12, '720p HD Portrait', 450, 800, 720, 1280, 2, 1),
(13, '4k', 800, 450, 4096, 2304, 2, 1),
(14, 'Common PC Monitor 4:3', 800, 600, 1024, 768, 2, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
  `eventID` int(11) NOT NULL AUTO_INCREMENT,
  `CampaignID` int(11) NOT NULL,
  `DisplayGroupIDs` varchar(254) NOT NULL COMMENT 'A list of the display group ids for this event',
  `recurrence_type` enum('Minute','Hour','Day','Week','Month','Year') DEFAULT NULL,
  `recurrence_detail` varchar(100) DEFAULT NULL,
  `userID` int(11) NOT NULL,
  `is_priority` tinyint(4) NOT NULL,
  `FromDT` bigint(20) NOT NULL DEFAULT '0',
  `ToDT` bigint(20) NOT NULL DEFAULT '0',
  `recurrence_range` bigint(20) DEFAULT NULL,
  `DisplayOrder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventID`),
  KEY `layoutID` (`CampaignID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='High level schedule information' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `schedule_detail`
--

CREATE TABLE IF NOT EXISTS `schedule_detail` (
  `schedule_detailID` int(11) NOT NULL AUTO_INCREMENT,
  `DisplayGroupID` int(11) NOT NULL,
  `userID` int(8) NOT NULL DEFAULT '1' COMMENT 'Owner of the Event',
  `eventID` int(11) DEFAULT NULL,
  `FromDT` bigint(20) NOT NULL DEFAULT '0',
  `ToDT` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`schedule_detailID`),
  KEY `scheduleID` (`eventID`),
  KEY `DisplayGroupID` (`DisplayGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Replicated schedule across displays and recurrence' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `session_id` varchar(160) NOT NULL,
  `session_data` longtext NOT NULL,
  `session_expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `LastAccessed` datetime DEFAULT NULL,
  `LastPage` varchar(25) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `IsExpired` tinyint(4) NOT NULL DEFAULT '1',
  `UserAgent` varchar(254) DEFAULT NULL,
  `RemoteAddr` varchar(50) DEFAULT NULL,
  `SecurityToken` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`session_id`),
  KEY `userID` (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `session`
--

INSERT INTO `session` (`session_id`, `session_data`, `session_expiration`, `LastAccessed`, `LastPage`, `userID`, `IsExpired`, `UserAgent`, `RemoteAddr`, `SecurityToken`) VALUES
('4ge600tg34hqskvcana0c8ll85', 'pagename|s:5:"index";token|s:32:"667d5f2060a087fbdf02930867bb0613";token_timeout|i:1445633763;message|s:0:"";', 1445635203, '2015-10-23 20:56:03', 'login', NULL, 0, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', '::1', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `settingid` int(11) NOT NULL AUTO_INCREMENT,
  `setting` varchar(50) NOT NULL,
  `value` varchar(1000) NOT NULL,
  `fieldType` varchar(24) NOT NULL,
  `helptext` text,
  `options` varchar(254) DEFAULT NULL,
  `cat` varchar(24) NOT NULL DEFAULT 'general',
  `userChange` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Can the user change this setting',
  `title` varchar(254) NOT NULL,
  `validation` varchar(50) NOT NULL,
  `ordering` int(11) NOT NULL,
  `default` varchar(1000) NOT NULL,
  `userSee` tinyint(4) NOT NULL DEFAULT '1',
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`settingid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=86 ;

--
-- Tablo döküm verisi `setting`
--

INSERT INTO `setting` (`settingid`, `setting`, `value`, `fieldType`, `helptext`, `options`, `cat`, `userChange`, `title`, `validation`, `ordering`, `default`, `userSee`, `type`) VALUES
(1, 'MEDIA_DEFAULT', 'private', 'dropdown', 'Media will be created with these settings. If public everyone will be able to view and use this media.', 'private|public', 'permissions', 1, 'Media Permissions', '', 20, 'private', 1, 'word'),
(2, 'LAYOUT_DEFAULT', 'private', 'dropdown', 'New layouts will be created with these settings. If public everyone will be able to view and use this layout.', 'private|public', 'permissions', 1, 'Layout Permissions', '', 10, 'private', 1, 'word'),
(3, 'defaultUsertype', 'User', 'dropdown', 'Sets the default user type selected when creating a user.\r\n<br />\r\nWe recommend that this is set to "User"', 'User|Group Admin|Super Admin', 'users', 1, 'Default User Type', '', 10, 'User', 1, 'string'),
(7, 'userModule', 'module_user_general.php', 'dirselect', 'This sets which user authentication module is currently being used.', NULL, 'users', 0, 'User Module', '', 0, 'module_user_general.php', 0, 'string'),
(11, 'defaultTimezone', 'UTC', 'timezone', 'Set the default timezone for the application', 'Europe/London', 'regional', 1, 'Timezone', '', 20, 'Europe/London', 1, 'string'),
(18, 'mail_to', 'mail@yoursite.com', 'email', 'Errors will be mailed here', NULL, 'maintenance', 1, 'Admin email address', '', 30, 'mail@yoursite.com', 1, 'string'),
(19, 'mail_from', 'mail@yoursite.com', 'email', 'Mail will be sent from this address', NULL, 'maintenance', 1, 'Sending email address', '', 40, 'mail@yoursite.com', 1, 'string'),
(23, 'jpg_length', '10', 'number', 'Default length for JPG files (in seconds)', NULL, 'content', 1, 'Default Image Duration', '', 30, '10', 1, 'int'),
(26, 'ppt_length', '10', 'number', 'Default length for PPT files (in seconds)', NULL, 'content', 1, 'Default PowerPoint Duration', '', 10, '10', 1, 'int'),
(29, 'swf_length', '10', 'number', 'Default length for SWF files', NULL, 'content', 1, 'Default Flash Duration', '', 20, '10', 1, 'int'),
(30, 'audit', 'error', 'dropdown', 'Set the level of logging the CMS should record. In production systems "error" is recommended.', 'error|info|audit|off', 'troubleshooting', 1, 'Log Level', '', 20, 'error', 1, 'word'),
(33, 'LIBRARY_LOCATION', 'C:\\Development\\Storage\\Xibo/', 'text', 'The fully qualified path to the CMS library location.', NULL, 'configuration', 1, 'Library Location', 'required', 10, '', 1, 'string'),
(34, 'SERVER_KEY', 'dqYR5e', 'text', NULL, NULL, 'configuration', 1, 'CMS Secret Key', 'required', 20, '', 1, 'string'),
(35, 'HELP_BASE', 'http://www.xibo.org.uk/manual/en/', 'text', NULL, NULL, 'general', 1, 'Location of the Manual', 'required', 10, 'http://www.xibo.org.uk/manual/', 1, 'string'),
(36, 'PHONE_HOME', 'Off', 'dropdown', 'Should the server send anonymous statistics back to the Xibo project?', 'On|Off', 'general', 1, 'Allow usage tracking?', '', 10, 'On', 1, 'word'),
(37, 'PHONE_HOME_KEY', '84442f667b6d215cd0d3b61c23ee8324', 'text', 'Key used to distinguish each Xibo instance. This is generated randomly based on the time you first installed Xibo, and is completely untraceable.', NULL, 'general', 0, 'Phone home key', '', 20, '', 0, 'string'),
(38, 'PHONE_HOME_URL', 'http://www.xibo.org.uk/stats/track.php', 'text', 'The URL to connect to to PHONE_HOME (if enabled)', NULL, 'network', 0, 'Phone home URL', '', 60, 'http://www.xibo.org.uk/stats/track.php', 0, 'string'),
(39, 'PHONE_HOME_DATE', '0', 'text', 'The last time we PHONED_HOME in seconds since the epoch', NULL, 'general', 0, 'Phone home time', '', 30, '0', 0, 'int'),
(40, 'SERVER_MODE', 'Production', 'dropdown', 'This should only be set if you want to display the maximum allowed error messaging through the user interface. <br /> Useful for capturing critical php errors and environment issues.', 'Production|Test', 'troubleshooting', 1, 'Server Mode', '', 30, 'Production', 1, 'word'),
(41, 'MAINTENANCE_ENABLED', 'Off', 'dropdown', 'Allow the maintenance script to run if it is called?', 'Protected|On|Off', 'maintenance', 1, 'Enable Maintenance?', '', 10, 'Off', 1, 'word'),
(42, 'MAINTENANCE_EMAIL_ALERTS', 'On', 'dropdown', 'Global switch for email alerts to be sent', 'On|Off', 'maintenance', 1, 'Enable Email Alerts?', '', 20, 'On', 1, 'word'),
(43, 'MAINTENANCE_KEY', 'changeme', 'text', 'String appended to the maintenance script to prevent malicious calls to the script.', NULL, 'maintenance', 1, 'Maintenance Key', '', 50, 'changeme', 1, 'string'),
(44, 'MAINTENANCE_LOG_MAXAGE', '30', 'number', 'Maximum age for log entries. Set to 0 to keep logs indefinitely.', NULL, 'maintenance', 1, 'Max Log Age', '', 60, '30', 1, 'int'),
(45, 'MAINTENANCE_STAT_MAXAGE', '30', 'number', 'Maximum age for statistics entries. Set to 0 to keep statistics indefinitely.', NULL, 'maintenance', 1, 'Max Statistics Age', '', 70, '30', 1, 'int'),
(46, 'MAINTENANCE_ALERT_TOUT', '12', 'number', 'How long in minutes after the last time a client connects should we send an alert? Can be overridden on a per client basis.', NULL, 'maintenance', 1, 'Max Display Timeout', '', 80, '12', 1, 'int'),
(47, 'SHOW_DISPLAY_AS_VNCLINK', '', 'text', 'Turn the display name in display management into a VNC link using the IP address last collected. The %s is replaced with the IP address. Leave blank to disable.', NULL, 'displays', 1, 'Display a VNC Link?', '', 30, '', 1, 'string'),
(48, 'SHOW_DISPLAY_AS_VNC_TGT', '_top', 'text', 'If the display name is shown as a link in display management, what target should the link have? Set _top to open the link in the same window or _blank to open in a new window.', NULL, 'displays', 1, 'Open VNC Link in new window?', '', 40, '_top', 1, 'string'),
(49, 'MAINTENANCE_ALWAYS_ALERT', 'Off', 'dropdown', 'Should Xibo send an email if a display is in an error state every time the maintenance script runs?', 'On|Off', 'maintenance', 1, 'Send repeat Display Timeouts', '', 80, 'Off', 1, 'word'),
(50, 'SCHEDULE_LOOKAHEAD', 'On', 'dropdown', 'Should Xibo send future schedule information to clients?', 'On|Off', 'general', 0, 'Send Schedule in advance?', '', 40, 'On', 1, 'word'),
(51, 'REQUIRED_FILES_LOOKAHEAD', '172800', 'number', 'How many seconds in to the future should the calls to RequiredFiles look?', NULL, 'general', 1, 'Send files in advance?', '', 50, '172800', 1, 'int'),
(52, 'REGION_OPTIONS_COLOURING', 'Media Colouring', 'dropdown', NULL, 'Media Colouring|Permissions Colouring', 'permissions', 1, 'How to colour Media on the Region Timeline', '', 30, 'Media Colouring', 1, 'string'),
(53, 'LAYOUT_COPY_MEDIA_CHECKB', 'Unchecked', 'dropdown', 'Default the checkbox for making duplicates of media when copying layouts', 'Checked|Unchecked', 'defaults', 1, 'Default copy media when copying a layout?', '', 20, 'Unchecked', 1, 'word'),
(54, 'MAX_LICENSED_DISPLAYS', '0', 'number', 'The maximum number of licensed clients for this server installation. 0 = unlimited', NULL, 'displays', 0, 'Number of display slots', '', 50, '0', 0, 'int'),
(55, 'LIBRARY_MEDIA_UPDATEINALL_CHECKB', 'Unchecked', 'dropdown', 'Default the checkbox for updating media on all layouts when editing in the library', 'Checked|Unchecked', 'defaults', 1, 'Default update media in all layouts', '', 10, 'Unchecked', 1, 'word'),
(56, 'USER_PASSWORD_POLICY', '', 'text', 'Regular Expression for password complexity, leave blank for no policy.', '', 'users', 1, 'Password Policy Regular Expression', '', 20, '', 1, 'string'),
(57, 'USER_PASSWORD_ERROR', '', 'text', 'A text description of this password policy. Will be show to users when their password does not meet the required policy', '', 'users', 1, 'Description of Password Policy', '', 30, '', 1, 'string'),
(58, 'MODULE_CONFIG_LOCKED_CHECKB', 'Unchecked', 'dropdown', 'Is the module config locked? Useful for Service providers.', 'Checked|Unchecked', 'defaults', 0, 'Lock Module Config', '', 30, 'Unchecked', 0, 'word'),
(59, 'LIBRARY_SIZE_LIMIT_KB', '0', 'number', 'The Limit for the Library Size in KB', NULL, 'network', 0, 'Library Size Limit', '', 50, '0', 1, 'int'),
(60, 'MONTHLY_XMDS_TRANSFER_LIMIT_KB', '0', 'number', 'XMDS Transfer Limit in KB/month', NULL, 'network', 0, 'Monthly bandwidth Limit', '', 40, '0', 1, 'int'),
(61, 'DEFAULT_LANGUAGE', 'en_GB', 'text', 'The default language to use', NULL, 'regional', 1, 'Default Language', '', 10, 'en_GB', 1, 'string'),
(62, 'TRANSITION_CONFIG_LOCKED_CHECKB', 'Unchecked', 'dropdown', 'Is the Transition config locked?', 'Checked|Unchecked', 'defaults', 0, 'Allow modifications to the transition configuration?', '', 40, 'Unchecked', 1, 'word'),
(63, 'GLOBAL_THEME_NAME', 'default', 'text', 'The Theme to apply to all pages by default', NULL, 'configuration', 1, 'CMS Theme', '', 30, 'default', 1, 'word'),
(64, 'DEFAULT_LAT', '51.504', 'number', 'The Latitude to apply for any Geo aware Previews', NULL, 'displays', 1, 'Default Latitude', '', 10, '51.504', 1, 'double'),
(65, 'DEFAULT_LONG', '-0.104', 'number', 'The Longitude to apply for any Geo aware Previews', NULL, 'displays', 1, 'Default Longitude', '', 20, '-0.104', 1, 'double'),
(66, 'SCHEDULE_WITH_VIEW_PERMISSION', 'No', 'dropdown', 'Should users with View permissions on displays be allowed to schedule to them?', 'Yes|No', 'permissions', 1, 'Schedule with view permissions?', '', 40, 'No', 1, 'word'),
(67, 'SETTING_IMPORT_ENABLED', '1', 'checkbox', NULL, NULL, 'general', 1, 'Allow Import?', '', 80, '1', 1, 'checkbox'),
(68, 'SETTING_LIBRARY_TIDY_ENABLED', '1', 'checkbox', NULL, NULL, 'general', 1, 'Enable Library Tidy?', '', 90, '1', 1, 'checkbox'),
(69, 'SENDFILE_MODE', 'Off', 'dropdown', 'When a user downloads a file from the library or previews a layout, should we attempt to use Apache X-Sendfile, Nginx X-Accel, or PHP (Off) to return the file from the library?', 'Off|Apache|Nginx', 'general', 1, 'File download mode', '', 60, 'Off', 1, 'word'),
(70, 'EMBEDDED_STATUS_WIDGET', '', 'text', 'HTML to embed in an iframe on the Status Dashboard', NULL, 'general', 0, 'Status Dashboard Widget', '', 70, '', 1, 'htmlstring'),
(71, 'PROXY_HOST', '', 'text', 'The Proxy URL', NULL, 'network', 1, 'Proxy URL', '', 10, '', 1, 'string'),
(72, 'PROXY_PORT', '0', 'number', 'The Proxy Port', NULL, 'network', 1, 'Proxy Port', '', 20, '0', 1, 'int'),
(73, 'PROXY_AUTH', '', 'text', 'The Authentication information for this proxy. username:password', NULL, 'network', 1, 'Proxy Credentials', '', 30, '', 1, 'string'),
(74, 'DATE_FORMAT', 'Y-m-d H:i', 'text', 'The Date Format to use when displaying dates in the CMS.', NULL, 'regional', 1, 'Date Format', 'required', 30, 'Y-m-d', 1, 'string'),
(75, 'DETECT_LANGUAGE', '1', 'checkbox', 'Detect the browser language?', NULL, 'regional', 1, 'Detect Language', '', 40, '1', 1, 'checkbox'),
(76, 'DEFAULTS_IMPORTED', '1', 'text', 'Has the default layout been imported?', NULL, 'general', 0, 'Defaults Imported?', 'required', 100, '0', 0, 'checkbox'),
(77, 'FORCE_HTTPS', '0', 'checkbox', 'Force the portal into HTTPS?', NULL, 'network', 1, 'Force HTTPS?', '', 70, '0', 1, 'checkbox'),
(78, 'ISSUE_STS', '0', 'checkbox', 'Add STS to the response headers? Make sure you fully understand STS before turning it on as it will prevent access via HTTP after the first successful HTTPS connection.', NULL, 'network', 1, 'Enable STS?', '', 80, '0', 1, 'checkbox'),
(79, 'STS_TTL', '600', 'text', 'The Time to Live (maxage) of the STS header expressed in minutes.', NULL, 'network', 1, 'STS Time out', '', 90, '600', 1, 'int'),
(80, 'MAINTENANCE_ALERTS_FOR_VIEW_USERS', '0', 'checkbox', 'Email maintenance alerts for users with view permissions to effected Displays.', NULL, 'displays', 1, 'Maintenance Alerts for Users', '', 60, '0', 1, 'checkbox'),
(81, 'CALENDAR_TYPE', 'Gregorian', 'dropdown', 'Which Calendar Type should the CMS use?', 'Gregorian|Jalali', 'regional', 1, 'Calendar Type', '', 50, 'Gregorian', 1, 'string'),
(82, 'DASHBOARD_LATEST_NEWS_ENABLED', '1', 'checkbox', 'Should the Dashboard show latest news? The address is provided by the theme.', '', 'general', 1, 'Enable Latest News?', '', 110, '1', 1, 'checkbox'),
(83, 'LIBRARY_MEDIA_DELETEOLDVER_CHECKB', 'Unchecked', 'dropdown', 'Default the checkbox for Deleting Old Version of media when a new file is being uploaded to the library.', 'Checked|Unchecked', 'defaults', 1, 'Default for "Delete old version of Media" checkbox. Shown when Editing Library Media.', '', 50, 'Unchecked', 1, 'dropdown'),
(84, 'USE_INTL_DATEFORMAT', '0', 'checkbox', 'Should dates be internationalised where possible.', '', 'regional', 1, 'Show international dates?', '', 60, '0', 1, 'checkbox'),
(85, 'PROXY_EXCEPTIONS', '', 'text', 'Hosts and Keywords that should not be loaded via the Proxy Specified. These should be comma separated.', '', 'network', 1, 'Proxy Exceptions', '', 32, '', 1, 'text');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `stat`
--

CREATE TABLE IF NOT EXISTS `stat` (
  `statID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Type` varchar(20) NOT NULL,
  `statDate` datetime NOT NULL COMMENT 'State entry date',
  `scheduleID` int(8) NOT NULL,
  `displayID` int(4) NOT NULL,
  `layoutID` int(8) DEFAULT NULL,
  `mediaID` varchar(50) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `Tag` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`statID`),
  KEY `statDate` (`statDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `tagId` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) NOT NULL,
  PRIMARY KEY (`tagId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Tablo döküm verisi `tag`
--

INSERT INTO `tag` (`tagId`, `tag`) VALUES
(1, 'template'),
(2, 'background'),
(3, 'thumbnail'),
(4, '\n    default\n  '),
(5, 'imported');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `transition`
--

CREATE TABLE IF NOT EXISTS `transition` (
  `TransitionID` int(11) NOT NULL AUTO_INCREMENT,
  `Transition` varchar(254) NOT NULL,
  `Code` varchar(50) NOT NULL,
  `HasDuration` tinyint(4) NOT NULL,
  `HasDirection` tinyint(4) NOT NULL,
  `AvailableAsIn` tinyint(4) NOT NULL,
  `AvailableAsOut` tinyint(4) NOT NULL,
  PRIMARY KEY (`TransitionID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Tablo döküm verisi `transition`
--

INSERT INTO `transition` (`TransitionID`, `Transition`, `Code`, `HasDuration`, `HasDirection`, `AvailableAsIn`, `AvailableAsOut`) VALUES
(1, 'Fade In', 'fadeIn', 1, 0, 0, 0),
(2, 'Fade Out', 'fadeOut', 1, 0, 0, 0),
(3, 'Fly', 'fly', 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `usertypeid` int(8) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `UserPassword` varchar(128) NOT NULL,
  `loggedin` tinyint(1) NOT NULL DEFAULT '0',
  `lastaccessed` datetime DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL COMMENT 'The users email address',
  `homepage` varchar(254) NOT NULL DEFAULT 'dashboard.php' COMMENT 'The users homepage',
  `Retired` tinyint(4) NOT NULL DEFAULT '0',
  `CSPRNG` tinyint(4) NOT NULL DEFAULT '0',
  `newUserWizard` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`),
  KEY `usertypeid` (`usertypeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Tablo döküm verisi `user`
--

INSERT INTO `user` (`UserID`, `usertypeid`, `UserName`, `UserPassword`, `loggedin`, `lastaccessed`, `email`, `homepage`, `Retired`, `CSPRNG`, `newUserWizard`) VALUES
(1, 1, 'root', 'sha256:1000:ifAp0gd67rCEUIN8+tc0ntMnTAgOTO8F:YhPrK15dn2pdouds6Y0FlD7QI15W7Sn1', 0, '2015-10-19 17:16:42', '', 'statusdashboard', 0, 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `usertype`
--

CREATE TABLE IF NOT EXISTS `usertype` (
  `usertypeid` int(8) NOT NULL,
  `usertype` varchar(16) NOT NULL,
  PRIMARY KEY (`usertypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `usertype`
--

INSERT INTO `usertype` (`usertypeid`, `usertype`) VALUES
(1, 'Super Admin'),
(2, 'Group Admin'),
(3, 'User');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `version`
--

CREATE TABLE IF NOT EXISTS `version` (
  `app_ver` varchar(20) DEFAULT NULL,
  `XmdsVersion` smallint(6) NOT NULL,
  `XlfVersion` smallint(6) NOT NULL,
  `DBVersion` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Version information';

--
-- Tablo döküm verisi `version`
--

INSERT INTO `version` (`app_ver`, `XmdsVersion`, `XlfVersion`, `DBVersion`) VALUES
('1.7.4', 4, 2, 89);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `xmdsnonce`
--

CREATE TABLE IF NOT EXISTS `xmdsnonce` (
  `nonceId` bigint(20) NOT NULL AUTO_INCREMENT,
  `nonce` varchar(100) NOT NULL,
  `expiry` int(11) NOT NULL,
  `lastUsed` int(11) DEFAULT NULL,
  `displayId` int(11) NOT NULL,
  `fileId` int(11) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `storedAs` varchar(100) DEFAULT NULL,
  `layoutId` int(11) DEFAULT NULL,
  `regionId` varchar(100) DEFAULT NULL,
  `mediaId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nonceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `blacklist`
--
ALTER TABLE `blacklist`
  ADD CONSTRAINT `blacklist_ibfk_1` FOREIGN KEY (`MediaID`) REFERENCES `media` (`mediaID`),
  ADD CONSTRAINT `blacklist_ibfk_2` FOREIGN KEY (`DisplayID`) REFERENCES `display` (`displayid`);

--
-- Tablo kısıtlamaları `campaign`
--
ALTER TABLE `campaign`
  ADD CONSTRAINT `campaign_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Tablo kısıtlamaları `datasetcolumn`
--
ALTER TABLE `datasetcolumn`
  ADD CONSTRAINT `datasetcolumn_ibfk_1` FOREIGN KEY (`DataSetID`) REFERENCES `dataset` (`DataSetID`);

--
-- Tablo kısıtlamaları `datasetdata`
--
ALTER TABLE `datasetdata`
  ADD CONSTRAINT `datasetdata_ibfk_1` FOREIGN KEY (`DataSetColumnID`) REFERENCES `datasetcolumn` (`DataSetColumnID`);

--
-- Tablo kısıtlamaları `file`
--
ALTER TABLE `file`
  ADD CONSTRAINT `file_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Tablo kısıtlamaları `lkcampaigngroup`
--
ALTER TABLE `lkcampaigngroup`
  ADD CONSTRAINT `lkcampaigngroup_ibfk_1` FOREIGN KEY (`CampaignID`) REFERENCES `campaign` (`CampaignID`),
  ADD CONSTRAINT `lkcampaigngroup_ibfk_2` FOREIGN KEY (`GroupID`) REFERENCES `group` (`groupID`);

--
-- Tablo kısıtlamaları `lkcampaignlayout`
--
ALTER TABLE `lkcampaignlayout`
  ADD CONSTRAINT `lkcampaignlayout_ibfk_1` FOREIGN KEY (`CampaignID`) REFERENCES `campaign` (`CampaignID`),
  ADD CONSTRAINT `lkcampaignlayout_ibfk_2` FOREIGN KEY (`LayoutID`) REFERENCES `layout` (`layoutID`);

--
-- Tablo kısıtlamaları `lkdatasetgroup`
--
ALTER TABLE `lkdatasetgroup`
  ADD CONSTRAINT `lkdatasetgroup_ibfk_1` FOREIGN KEY (`DataSetID`) REFERENCES `dataset` (`DataSetID`),
  ADD CONSTRAINT `lkdatasetgroup_ibfk_2` FOREIGN KEY (`GroupID`) REFERENCES `group` (`groupID`);

--
-- Tablo kısıtlamaları `lkdisplaydg`
--
ALTER TABLE `lkdisplaydg`
  ADD CONSTRAINT `lkdisplaydg_ibfk_1` FOREIGN KEY (`DisplayGroupID`) REFERENCES `displaygroup` (`DisplayGroupID`),
  ADD CONSTRAINT `lkdisplaydg_ibfk_2` FOREIGN KEY (`DisplayID`) REFERENCES `display` (`displayid`);

--
-- Tablo kısıtlamaları `lkdisplaygroupgroup`
--
ALTER TABLE `lkdisplaygroupgroup`
  ADD CONSTRAINT `lkdisplaygroupgroup_ibfk_1` FOREIGN KEY (`GroupID`) REFERENCES `group` (`groupID`),
  ADD CONSTRAINT `lkdisplaygroupgroup_ibfk_2` FOREIGN KEY (`DisplayGroupID`) REFERENCES `displaygroup` (`DisplayGroupID`);

--
-- Tablo kısıtlamaları `lklayoutmedia`
--
ALTER TABLE `lklayoutmedia`
  ADD CONSTRAINT `lklayoutmedia_ibfk_1` FOREIGN KEY (`mediaID`) REFERENCES `media` (`mediaID`),
  ADD CONSTRAINT `lklayoutmedia_ibfk_2` FOREIGN KEY (`layoutID`) REFERENCES `layout` (`layoutID`);

--
-- Tablo kısıtlamaları `lklayoutmediagroup`
--
ALTER TABLE `lklayoutmediagroup`
  ADD CONSTRAINT `lklayoutmediagroup_ibfk_1` FOREIGN KEY (`LayoutID`) REFERENCES `layout` (`layoutID`),
  ADD CONSTRAINT `lklayoutmediagroup_ibfk_2` FOREIGN KEY (`GroupID`) REFERENCES `group` (`groupID`);

--
-- Tablo kısıtlamaları `lklayoutregiongroup`
--
ALTER TABLE `lklayoutregiongroup`
  ADD CONSTRAINT `lklayoutregiongroup_ibfk_1` FOREIGN KEY (`LayoutID`) REFERENCES `layout` (`layoutID`),
  ADD CONSTRAINT `lklayoutregiongroup_ibfk_2` FOREIGN KEY (`GroupID`) REFERENCES `group` (`groupID`);

--
-- Tablo kısıtlamaları `lkmediagroup`
--
ALTER TABLE `lkmediagroup`
  ADD CONSTRAINT `lkmediagroup_ibfk_1` FOREIGN KEY (`MediaID`) REFERENCES `media` (`mediaID`),
  ADD CONSTRAINT `lkmediagroup_ibfk_2` FOREIGN KEY (`GroupID`) REFERENCES `group` (`groupID`);

--
-- Tablo kısıtlamaları `lkmenuitemgroup`
--
ALTER TABLE `lkmenuitemgroup`
  ADD CONSTRAINT `lkmenuitemgroup_ibfk_1` FOREIGN KEY (`GroupID`) REFERENCES `group` (`groupID`),
  ADD CONSTRAINT `lkmenuitemgroup_ibfk_2` FOREIGN KEY (`MenuItemID`) REFERENCES `menuitem` (`MenuItemID`);

--
-- Tablo kısıtlamaları `lkpagegroup`
--
ALTER TABLE `lkpagegroup`
  ADD CONSTRAINT `lkpagegroup_ibfk_1` FOREIGN KEY (`pageID`) REFERENCES `pages` (`pageID`),
  ADD CONSTRAINT `lkpagegroup_ibfk_2` FOREIGN KEY (`groupID`) REFERENCES `group` (`groupID`);

--
-- Tablo kısıtlamaları `lkusergroup`
--
ALTER TABLE `lkusergroup`
  ADD CONSTRAINT `lkusergroup_ibfk_1` FOREIGN KEY (`GroupID`) REFERENCES `group` (`groupID`),
  ADD CONSTRAINT `lkusergroup_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Tablo kısıtlamaları `menuitem`
--
ALTER TABLE `menuitem`
  ADD CONSTRAINT `menuitem_ibfk_1` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`MenuID`),
  ADD CONSTRAINT `menuitem_ibfk_2` FOREIGN KEY (`PageID`) REFERENCES `pages` (`pageID`);

--
-- Tablo kısıtlamaları `oauth_server_registry`
--
ALTER TABLE `oauth_server_registry`
  ADD CONSTRAINT `oauth_server_registry_ibfk_1` FOREIGN KEY (`osr_usa_id_ref`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `oauth_server_token`
--
ALTER TABLE `oauth_server_token`
  ADD CONSTRAINT `oauth_server_token_ibfk_1` FOREIGN KEY (`ost_osr_id_ref`) REFERENCES `oauth_server_registry` (`osr_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `oauth_server_token_ibfk_2` FOREIGN KEY (`ost_usa_id_ref`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_ibfk_1` FOREIGN KEY (`pagegroupID`) REFERENCES `pagegroup` (`pagegroupID`);

--
-- Tablo kısıtlamaları `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`CampaignID`) REFERENCES `campaign` (`CampaignID`);

--
-- Tablo kısıtlamaları `schedule_detail`
--
ALTER TABLE `schedule_detail`
  ADD CONSTRAINT `schedule_detail_ibfk_7` FOREIGN KEY (`eventID`) REFERENCES `schedule` (`eventID`),
  ADD CONSTRAINT `schedule_detail_ibfk_8` FOREIGN KEY (`DisplayGroupID`) REFERENCES `displaygroup` (`DisplayGroupID`);

--
-- Tablo kısıtlamaları `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`usertypeid`) REFERENCES `usertype` (`usertypeid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
