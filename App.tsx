import { StatusBar } from 'expo-status-bar';
import { useState } from 'react';
import {
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
  Platform,
  ScrollView,
} from 'react-native';

export default function App() {
  const [count, setCount] = useState(0);

  // 获取平台信息
  const getPlatformName = () => {
    if (Platform.OS === 'web') {
      // 检测是否在Electron中运行
      // Electron 会在 userAgent 中包含 "Electron"
      const userAgent = typeof navigator !== 'undefined' ? navigator.userAgent : '';
      if (userAgent.includes('Electron')) {
        return 'Windows (Electron)';
      }
      return 'Web';
    }
    return Platform.OS.charAt(0).toUpperCase() + Platform.OS.slice(1);
  };

  const platformName = getPlatformName();
  const platformVersion = Platform.Version || '0.0.0';

  return (
    <ScrollView style={styles.scrollView} contentContainerStyle={styles.scrollContent}>
      <View style={styles.container}>
        {/* 顶部品牌区块 */}
        <View style={styles.header}>
          <Text style={styles.emoji}>🚀</Text>
          <Text style={styles.title}>MultiPlatformApp</Text>
          <Text style={styles.subtitle}>跨平台应用模板 1.12</Text>
        </View>

        {/* 平台信息卡片 */}
        <View style={styles.card}>
          <Text style={styles.cardTitle}>当前运行平台</Text>
          <Text style={styles.platformName}>{platformName}</Text>
          <Text style={styles.platformInfo}>Platform.OS: {Platform.OS}</Text>
          <Text style={styles.platformInfo}>Platform.Version: {platformVersion}</Text>
        </View>

        {/* 交互计数器区块 */}
        <View style={styles.card}>
          <Text style={styles.cardTitle}>交互示例</Text>
          <Text style={styles.countText}>点击次数: {count}</Text>
          <View style={styles.buttonRow}>
            <TouchableOpacity
              style={[styles.button, styles.buttonPrimary]}
              onPress={() => setCount(count + 1)}
              activeOpacity={0.7}
            >
              <Text style={styles.buttonText}>点击 +</Text>
            </TouchableOpacity>
            <TouchableOpacity
              style={[styles.button, styles.buttonDanger]}
              onPress={() => setCount(0)}
              activeOpacity={0.7}
            >
              <Text style={styles.buttonText}>重置</Text>
            </TouchableOpacity>
          </View>
        </View>

        {/* 平台支持展示区块 */}
        <View style={styles.card}>
          <Text style={styles.cardTitle}>支持的平台</Text>
          <View style={styles.platformsRow}>
            <View style={styles.platformItem}>
              <Text style={styles.platformEmoji}>🤖</Text>
              <Text style={styles.platformLabel}>Android</Text>
            </View>
            <View style={styles.platformItem}>
              <Text style={styles.platformEmoji}>🌐</Text>
              <Text style={styles.platformLabel}>Web</Text>
            </View>
            <View style={styles.platformItem}>
              <Text style={styles.platformEmoji}>🪟</Text>
              <Text style={styles.platformLabel}>Windows</Text>
            </View>
          </View>
        </View>

        <StatusBar style="auto" />
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  scrollView: {
    flex: 1,
    backgroundColor: '#F5F5F5',
  },
  scrollContent: {
    flexGrow: 1,
  },
  container: {
    flex: 1,
    backgroundColor: '#F5F5F5',
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 40,
    paddingHorizontal: 20,
  },
  header: {
    alignItems: 'center',
    marginBottom: 30,
  },
  emoji: {
    fontSize: 64,
    marginBottom: 10,
  },
  title: {
    fontSize: 32,
    fontWeight: 'bold',
    color: '#333333',
    marginBottom: 8,
  },
  subtitle: {
    fontSize: 16,
    color: '#666666',
  },
  card: {
    width: '100%',
    maxWidth: 600,
    backgroundColor: '#FFFFFF',
    borderRadius: 16,
    padding: 24,
    marginBottom: 20,
    ...Platform.select({
      ios: {
        shadowColor: '#000',
        shadowOffset: { width: 0, height: 2 },
        shadowOpacity: 0.1,
        shadowRadius: 8,
      },
      android: {
        elevation: 4,
      },
      web: {
        boxShadow: '0 2px 8px rgba(0, 0, 0, 0.1)',
      },
    }),
  },
  cardTitle: {
    fontSize: 18,
    fontWeight: '600',
    color: '#333333',
    marginBottom: 16,
  },
  platformName: {
    fontSize: 32,
    fontWeight: 'bold',
    color: '#007AFF',
    marginBottom: 12,
  },
  platformInfo: {
    fontSize: 14,
    color: '#666666',
    marginTop: 4,
  },
  countText: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#333333',
    marginBottom: 20,
    textAlign: 'center',
  },
  buttonRow: {
    flexDirection: 'row',
    justifyContent: 'center',
    gap: 12,
  },
  button: {
    paddingVertical: 12,
    paddingHorizontal: 24,
    borderRadius: 8,
    minWidth: 120,
  },
  buttonPrimary: {
    backgroundColor: '#007AFF',
  },
  buttonDanger: {
    backgroundColor: '#FF3B30',
  },
  buttonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: '600',
    textAlign: 'center',
  },
  platformsRow: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    marginTop: 12,
  },
  platformItem: {
    alignItems: 'center',
  },
  platformEmoji: {
    fontSize: 48,
    marginBottom: 8,
  },
  platformLabel: {
    fontSize: 14,
    color: '#333333',
    fontWeight: '500',
  },
});
