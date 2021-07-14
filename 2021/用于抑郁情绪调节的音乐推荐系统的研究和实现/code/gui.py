# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'gui.ui'
#
# Created by: PyQt5 UI code generator 5.14.1
#
# WARNING! All changes made in this file will be lost!


from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        self.EC = False
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(600, 439)
        MainWindow.setAnimated(True)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Fixed, QtWidgets.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.centralwidget.sizePolicy().hasHeightForWidth())
        self.centralwidget.setSizePolicy(sizePolicy)
        self.centralwidget.setObjectName("centralwidget")

        self.layoutWidget = QtWidgets.QWidget(self.centralwidget)
        self.layoutWidget.setGeometry(QtCore.QRect(11, 11, 585, 30))
        self.layoutWidget.setObjectName("layoutWidget")
        self.horizontalLayout_2 = QtWidgets.QHBoxLayout(self.layoutWidget)
        self.horizontalLayout_2.setSizeConstraint(QtWidgets.QLayout.SetDefaultConstraint)
        self.horizontalLayout_2.setContentsMargins(0, 0, 0, 0)
        self.horizontalLayout_2.setObjectName("horizontalLayout_2")
        self.lab_name = QtWidgets.QLabel(self.layoutWidget)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Preferred, QtWidgets.QSizePolicy.Maximum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.lab_name.sizePolicy().hasHeightForWidth())
        self.lab_name.setSizePolicy(sizePolicy)
        self.lab_name.setAlignment(QtCore.Qt.AlignCenter)
        self.lab_name.setObjectName("lab_name")
        self.horizontalLayout_2.addWidget(self.lab_name)
        self.comboBox = QtWidgets.QComboBox(self.layoutWidget)
        self.horizontalLayout_2.addWidget(self.comboBox)
        self.btn_openFile = QtWidgets.QPushButton(self.layoutWidget)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Fixed, QtWidgets.QSizePolicy.Maximum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.btn_openFile.sizePolicy().hasHeightForWidth())
        self.btn_openFile.setSizePolicy(sizePolicy)
        self.btn_openFile.setObjectName("btn_openFile")
        self.horizontalLayout_2.addWidget(self.btn_openFile)

        self.btn_openFile1 = QtWidgets.QPushButton(self.layoutWidget)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Fixed, QtWidgets.QSizePolicy.Maximum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.btn_openFile1.sizePolicy().hasHeightForWidth())
        self.btn_openFile1.setSizePolicy(sizePolicy)
        self.btn_openFile1.setObjectName("btn_openFile1")
        self.horizontalLayout_2.addWidget(self.btn_openFile1)
        

        self.layoutWidget1 = QtWidgets.QWidget(self.centralwidget)
        self.layoutWidget1.setGeometry(QtCore.QRect(11, 50, 585, 30))
        self.layoutWidget1.setObjectName("layoutWidget")
        self.horizontalLayout_2 = QtWidgets.QHBoxLayout(self.layoutWidget1)
        self.horizontalLayout_2.setSizeConstraint(QtWidgets.QLayout.SetDefaultConstraint)
        self.horizontalLayout_2.setContentsMargins(0, 0, 0, 0)
        self.horizontalLayout_2.setObjectName("horizontalLayout_2")

        self.lab_name1 = QtWidgets.QLabel(self.layoutWidget1)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Preferred, QtWidgets.QSizePolicy.Maximum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.lab_name1.sizePolicy().hasHeightForWidth())
        self.lab_name1.setSizePolicy(sizePolicy)
        self.lab_name1.setAlignment(QtCore.Qt.AlignCenter)
        self.lab_name1.setObjectName("lab_name")
        self.horizontalLayout_2.addWidget(self.lab_name1)

        self.layoutWidget1 = QtWidgets.QWidget(self.centralwidget)
        self.layoutWidget1.setGeometry(QtCore.QRect(11, 400, 585, 30))
        self.layoutWidget1.setObjectName("layoutWidget1")
        self.horizontalLayout = QtWidgets.QHBoxLayout(self.layoutWidget1)
        self.horizontalLayout.setSizeConstraint(QtWidgets.QLayout.SetMaximumSize)
        self.horizontalLayout.setContentsMargins(0, 0, 0, 0)
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.lab_time = QtWidgets.QLabel(self.layoutWidget1)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Maximum, QtWidgets.QSizePolicy.Maximum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.lab_time.sizePolicy().hasHeightForWidth())
        self.lab_time.setSizePolicy(sizePolicy)
        self.lab_time.setObjectName("lab_time")
        self.horizontalLayout.addWidget(self.lab_time)
        self.slider_time = QtWidgets.QSlider(self.layoutWidget1)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Minimum, QtWidgets.QSizePolicy.Maximum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.slider_time.sizePolicy().hasHeightForWidth())
        self.slider_time.setSizePolicy(sizePolicy)
        self.slider_time.setOrientation(QtCore.Qt.Horizontal)
        self.slider_time.setObjectName("slider_time")
        self.horizontalLayout.addWidget(self.slider_time)
        self.lab_duration = QtWidgets.QLabel(self.layoutWidget1)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Maximum, QtWidgets.QSizePolicy.Maximum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.lab_duration.sizePolicy().hasHeightForWidth())
        self.lab_duration.setSizePolicy(sizePolicy)
        self.lab_duration.setObjectName("lab_duration")
        self.horizontalLayout.addWidget(self.lab_duration)
        self.btn_start = QtWidgets.QPushButton(self.layoutWidget1)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Fixed, QtWidgets.QSizePolicy.Maximum)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.btn_start.sizePolicy().hasHeightForWidth())
        self.btn_start.setSizePolicy(sizePolicy)
        self.btn_start.setObjectName("btn_start")
        self.horizontalLayout.addWidget(self.btn_start)
        self.verticalLayoutWidget = QtWidgets.QWidget(self.centralwidget)
        self.verticalLayoutWidget.setGeometry(QtCore.QRect(10, 40, 585, 361))
        self.verticalLayoutWidget.setObjectName("verticalLayoutWidget")
        self.container = QtWidgets.QVBoxLayout(self.verticalLayoutWidget)
        self.container.setContentsMargins(0, 30, 0, 0)
        self.container.setObjectName("container")
        MainWindow.setCentralWidget(self.centralwidget)

        # add combobox Roy
    
        self.comboBox.setCurrentText(" ")
        self.comboBox.currentText()
        self.comboBox.show()

        self.retranslateUi(MainWindow)
        self.btn_openFile1.clicked.connect(lambda: self.translate(MainWindow))
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        items = ["depressed", "sorrowful", "angry", "feverish", "desperate"]
        self.comboBox.addItems(items)
        MainWindow.setWindowTitle(_translate("MainWindow", "Music Recommendation System"))
        self.lab_name.setText(_translate("MainWindow", "Current emotional state"))
        self.btn_openFile.setText(_translate("MainWindow", "OK"))
        self.btn_openFile1.setText(_translate("MainWindow", "English/Chinese"))
        self.lab_time.setText(_translate("MainWindow", "00:00"))
        self.lab_duration.setText(_translate("MainWindow", "00:00"))
        self.btn_start.setText(_translate("MainWindow", "Play"))

    def translate(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        if(self.EC == False):
            self.comboBox.clear()
            items = ["压抑", "悲伤", "愤怒", "暴躁", "绝望"]
            self.comboBox.addItems(items)
            MainWindow.setWindowTitle(_translate("MainWindow", "音乐推荐系统"))
            self.lab_name.setText(_translate("MainWindow", "当前的情绪状态"))
            self.btn_openFile.setText(_translate("MainWindow", "确定"))
            self.btn_openFile1.setText(_translate("MainWindow", "中/英"))
            self.btn_start.setText(_translate("MainWindow", "播放"))
            self.EC = True
        else:
            self.comboBox.clear()
            items = ["depressed", "sorrowful", "angry", "feverish", "desperate"]
            self.comboBox.addItems(items)
            MainWindow.setWindowTitle(_translate("MainWindow", "Music Recommendation System"))
            self.lab_name.setText(_translate("MainWindow", "Current emotional state"))
            self.btn_openFile.setText(_translate("MainWindow", "OK"))
            self.btn_openFile1.setText(_translate("MainWindow", "English/Chinese"))
            self.btn_start.setText(_translate("MainWindow", "Play"))
            self.EC = False