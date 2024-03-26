import * as React from 'react';

import { StyleSheet, View } from 'react-native';
import { VlcView } from 'react-native-vlc';

export default function App() {
  return (
    <View style={styles.container}>
      <VlcView style={styles.box} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: '100%',
    height: '100%',
  },
});
