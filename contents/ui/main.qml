import QtQuick 2.15
import QtQuick.Layouts 1.15
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 3.0 as PlasmaComponents
import Qt.labs.platform 1.1 as Platform

PlasmoidItem {
    id: root
    width: 200
    height: 100

    property int counter: 0

    PlasmaComponents.Label {
        anchors.centerIn: parent
        text: "Bildirim sayısı: " + counter
        font.pointSize: 14
    }

    Timer {
        interval: 10000 // 10 saniye
        running: true
        repeat: true
        onTriggered: {
            sendNotification()
        }
    }

    Platform.SystemTrayIcon {
        id: systemTrayIcon
        visible: true
    }

    function sendNotification() {
        counter++
        systemTrayIcon.showMessage("Test Bildirimi", "Bu " + counter + ". bildirim")
    }
}
